<template>
  <v-app>
    <v-navigation-drawer v-model="drawer" app>
      <v-list dense>
        <template v-if="!user">
          <v-list-item link @click="$router.push({name:'login'})">
            <v-list-item-action>
              <v-icon>mdi-login</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Login</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item link @click="$router.push({name:'register'})">
            <v-list-item-action>
              <v-icon>mdi-account-multiple-plus</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Register</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
        <template v-else>
          <v-list-item link @click="$router.push({name:'login'})">
            <v-list-item-action>
              <v-icon>mdi-logout</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Logout</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item link @click="$router.push({name:'explore'})">
            <v-list-item-action>
              <v-icon>mdi-compass</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Explore</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item link @click="$router.push({name:'create'})">
            <v-list-item-action>
              <v-icon>mdi-creation</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Create</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item link @click="$router.push({name:'notes'})">
            <v-list-item-action>
              <v-icon>mdi-pencil</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Notes</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item link @click="$router.push({name:'search'})">
            <v-list-item-action>
              <v-icon>mdi-magnify</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Search</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app color="indigo" dark>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-toolbar-title>Simple Notes</v-toolbar-title>
    </v-app-bar>

    <v-content>
      <v-container fluid>
        <v-row align="center" justify="center">
          <v-col class="text-center">
            <router-view></router-view>
          </v-col>
        </v-row>
      </v-container>
    </v-content>
    <notifications position="bottom center" width="100%" group="info" />
  </v-app>
</template>

<script>
export default {
  name: "App",

  data: () => ({
    drawer: false
  }),

  computed: {
    user() {
      return this.$store.getters.getUser;
    }
  }
};
</script>
