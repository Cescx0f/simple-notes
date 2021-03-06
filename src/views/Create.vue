<template>
  <div>
      <v-subheader v-if="courses.length" >CREATE A NEW ENTITY</v-subheader>
      <v-card class="mx-auto create-group mb-4" outlined>
        <v-row>
          <create-course @created="fetchCourses" />
          <create-lesson @created="fetchLessons" />
        </v-row>
      </v-card>
      <v-subheader class="">OR CREATE A NEW NOTE</v-subheader>
      <v-card class="mx-auto create-group" outlined>
        <v-row>
          <v-col cols="5" md="5" sm="12">
            <v-text-field v-model="title" label="Title *" required></v-text-field>
          </v-col>
          <v-col cols="7" md="7" sm="12">
            <v-text-field v-model="description" label="Description"></v-text-field>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12">
            <v-select
              v-model="selectedCourse"
              :items="courses"
              label="Course *"
              item-text="name"
              item-value="id"
            ></v-select>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12">
            <v-select
              :disabled="!selectedCourse"
              v-model="selectedLesson"
              :items="recordLessons[selectedCourse]"
              label="Lesson *"
              item-text="display"
              item-value="id"
            ></v-select>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12">
            <v-btn color="primary" :disabled="!canCreateNote" @click="createNote">
              <v-icon>mdi-pencil</v-icon>Create Note
            </v-btn>
          </v-col>
        </v-row>
      </v-card>

  </div>
</template>

<script>
import { getCourses, getLessons, createNote } from "@/api.js";
import { groupBy, dateFormattedFromISO } from "@/utils.js";
import CreateCourse from "@/components/CreateCourse.vue";
import CreateLesson from "@/components/CreateLesson.vue";

export default {
  name: "create",

  components: {
    CreateCourse,
    CreateLesson
  },

  data() {
    return {
      courses: [],
      lessons: [],
      title: null,
      description: null,
      selectedCourse: null,
      selectedLesson: null
    };
  },

  mounted() {
    this.fetchCourses();
    this.fetchLessons();
  },

  computed: {
    recordLessons() {
      return groupBy(
        this.lessons.map((l) => {
          l.display = l.name + ' - ' + dateFormattedFromISO(l.date)
          return l;
        }), "course_id");
    },
    canCreateNote() {
      return (
        this.title && this.title.length > 0 &&
        this.selectedCourse &&
        this.selectedLesson
      );
    }
  },

  watch: {
    selectedCourse() {
        this.selectedLesson = null;
    }
  },

  methods: {
    fetchCourses() {
      getCourses().then(({ data }) => (this.courses = data.data));
    },
    fetchLessons() {
      getLessons().then(({ data }) => (this.lessons = data.data));
    },
    createNote() {
      createNote(this.title, this.description, this.selectedLesson)
      .then(({data}) => {
      this.$router.push({name: 'notes', params:{id: data.data.id}})
      })
    },
  }
};
</script>

<style>
.create-group {
  padding: 12px;
}
</style>