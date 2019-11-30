<template>
  <v-app>
    <v-card class="overflow-hidden">
      <v-app-bar
        absolute
        color="#6A76AB"
        dark
        :shrink-on-scroll="isInMainView"
        :prominent="isInMainView"
        src="./assets/bg.jpg"
        :fade-img-on-scroll="isInMainView"
        scroll-target="#scrolling-techniques-3"
      >
        <template v-slot:img="{ props }">
          <v-img v-if="isInMainView"
                 v-bind="props"
                 gradient="to top right, rgba(100,115,201,.7), rgba(25,32,72,.7)"
          ></v-img>
        </template>

        <v-app-bar-nav-icon></v-app-bar-nav-icon>

        <v-toolbar-title>테코러닝</v-toolbar-title>

        <v-spacer></v-spacer>

        <v-btn icon>
          <v-icon>mdi-magnify</v-icon>
        </v-btn>

        <v-btn icon>
          <v-icon>mdi-dots-vertical</v-icon>
        </v-btn>

        <template v-slot:extension>
          <v-tabs
            align-with-title
            background-color="transparent"
          >
            <v-tab>스터디</v-tab>
            <v-tab>책모임</v-tab>
            <v-tab>토이프로젝트</v-tab>
          </v-tabs>
        </template>
      </v-app-bar>
      <v-sheet
        id="scrolling-techniques-3"
        class="overflow-y-auto"
        max-height="600"
      >
        <v-container :style="getMainSheetStyle">
          <v-row>
            <component :is="view"></component>
          </v-row>
        </v-container>
      </v-sheet>
    </v-card>

    <v-bottom-navigation
      fixed
      grow
    >
      <v-btn
        icon
        @click="changeView(`StudyRecruitment`)"
      >
        <span>모집중</span>
        <v-icon>mdi-account-group</v-icon>
      </v-btn>

      <v-btn
        icon
        @click="changeView(`OngoingStudy`)"
      >
        <span>진행중</span>
        <v-icon>mdi-airplane-takeoff</v-icon>
      </v-btn>

      <v-btn
        icon
        @click="changeView(`FinishedStudy`)"
      >
        <span>완료한 스터디</span>
        <v-icon>mdi-check</v-icon>
      </v-btn>

      <v-btn
        icon
        @click="changeView(`MyPage`)"
      >
        <span>프로필</span>
        <v-icon>mdi-account</v-icon>
      </v-btn>
    </v-bottom-navigation>
  </v-app>
</template>

<script>
  import StudyRecruitment from "./components/study/StudyRecruitment";
  import OngoingStudy from "./components/study/OngoingStudy";
  import FinishedStudy from "./components/study/FinishedStudy";
  import MyPage from "./components/user/MyPage";
  import ParticipatingStudy from "./components/user/ParticipatingStudy";

  export default {
    name: 'App',
    components: {
      StudyGeneration,
      StudyRecruitment,
      OngoingStudy,
      FinishedStudy,
      MyPage,
      ParticipatingStudy,
    },
    data() {
      return {
        view: `StudyRecruitment`,
        sheetMarginTop: `0px`,
        sheetMarginBottom: `0px`,
      }
    },
    methods: {
      changeView(componentName) {
        this.view = componentName;
      },
      resetSheetMargin() {
        this.sheetMarginTop = document.getElementsByTagName(`header`)[0].style.height;
        this.sheetMarginBottom = document.getElementsByClassName(`v-bottom-navigation`)[0].style.height
      },
    },
    computed: {
      isInMainView() {
        return this.view === `StudyRecruitment`;
      },
      getMainSheetStyle() {
        const marginTop = parseInt(this.sheetMarginTop);
        const minHeight = window.screen.height - marginTop - parseInt(this.sheetMarginBottom);

        return `min-height: ${String(minHeight)}px;
                margin-top: ${String(marginTop)}px;`
      },
    },
    mounted() {
      this.resetSheetMargin();
    },
    updated() {
      this.resetSheetMargin();
    }
  };
</script>

<style>
</style>
