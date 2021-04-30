<template>
  <div class="index">
    <!-- <h1 class="custom-h1">Index - pagina di ricerca avanzata</h1> -->
    <br />
    <button class="btn button-none">
      <a href="/"><i class="fas fa-arrow-left"></i></a>
    </button>

    <div class="form-group search" v-if="specializations.length > 0">
      <select
        class="form-control"
        name="specializations"
        v-model="specId"
        autocomplete="on"
      >
        <option value="" disabled>scegli una specializzazione</option>
        <option value="0">vedi tutti i medici</option>
        <option
          v-for="(spec, index) in specializations"
          :key="index"
          :value="spec.id"
        >
          {{ spec.spec_name }}
        </option>
      </select>
    </div>

    <div class="form-group search">
      <select
        class="form-control"
        name="votes"
        v-model="vote"
        autocomplete="on"
      >
        <option value="" disabled>filtra per media voti</option>
        <option value="5" style="color: orange">
          &#9733; &#9733; &#9733; &#9733; &#9733;
        </option>
        <option value="4" style="color: orange">
          &#9733; &#9733; &#9733; &#9733;
        </option>
        <option value="3" style="color: orange">&#9733; &#9733; &#9733;</option>
        <option value="2" style="color: orange">&#9733; &#9733;</option>
        <option value="1" style="color: orange">&#9733;</option>
        <option value="0">qualunque voto</option>
      </select>
    </div>

    <div class="form-group search">
      <select
        class="form-control"
        name="specializations"
        v-model="orderBy"
        autocomplete="on"
      >
        <option value="" disabled>ordina per ...</option>
        <option value="reviewsNum">numero di recensioni</option>
      </select>
    </div>

    <table class="table table-hover my-table" v-if="users.length > 0">
      <thead>
        <tr>
          <th scope="col">Nome e Cognome</th>
          <th scope="col">Specializzazioni</th>
          <th scope="col" class="average">Media voti</th>
          <th scope="col"></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(user, index) in users" :key="index">
          <td>
            <a :href="'/doctors/' + user.id + '/' + specId">
              <div>{{ user.name }} {{ user.lastname }}</div>
            </a>
          </td>
          <td>
            <a :href="'/doctors/' + user.id + '/' + specId">
              <div v-for="(spec, index) in user.specializations" :key="index">
                {{ spec.spec_name }}
              </div>
            </a>
          </td>
          <td class="average">
            <a :href="'/doctors/' + user.id + '/' + specId">
              <i
                class="fas fa-star"
                style="color: orange"
                v-for="(star, index) in average(user)"
                :key="index"
              ></i>
              <span v-if="user.reviews.length > 0"
                >su {{ sum(user) }} recensioni</span
              >
              <span v-else>Non ci sono recensioni disponibili</span>
            </a>
          </td>
          <td class="img-col">
            <a :href="'/doctors/' + user.id + '/' + specId">
              <img
                :src="'../' + user.profile_image"
                width="150px"
                class="user-image"
              />
              <img src="https://prowly-uploads.s3.eu-west-1.amazonaws.com/uploads/4818/assets/40124/miodottore-mktpl-symbol-turquoise.png" class="sponsored-doc" v-if="sponsored.includes(user)">
            </a>
          </td>
        </tr>
      </tbody>
    </table>

    <div v-if="results === false">
      Mi dispiace, non ci sono risultati per i tuoi criteri di ricerca.
    </div>
  </div>
</template>

<script>
export default {
  props: { selected: Number, specializations: Array },
  data() {
    return {
      specId: this.selected,
      users: [],
      results: true,
      vote: "",
      orderBy: "",
      sponsored: [],
      notSponsored: []
    };
  },
  mounted() {
    return this.filterSpec();
  },
  watch: {
    specId: function () {
      return this.filterSpec().then(() => {
        this.vote = "";
        this.orderBy = "";
      });
    },
    vote: function () {
      return this.filterSpec().then(() => {
        this.orderBy = "";
        return this.filterVote();
      });
    },
    orderBy: function () {
      if (this.orderBy === "reviewsNum") {
        return this.sortUsers();
      }
    },
  },
  methods: {
    getAll: function () {
      return axios.get("http://127.0.0.1:8000/api/doctors").then((response) => {
        // data corrente
        let date = new Date();
        let currDate = Date.parse(date);
        // data scadenza sponsorizzazione
        var sponsDate;
        this.sponsored = [];
        this.notSponsored = [];

        let filtered = response.data.filter((el) => {
          if (el.sponsorships.length > 0) {
            el.sponsorships.forEach((spons) => {
              sponsDate = Date.parse(spons.pivot.expiration_time);
              if (currDate < sponsDate) {
                console.log("sponsorizzato!!");
                this.sponsored.push(el);
              }
            });
          }
          if (el.sponsorships.length == 0) {
            console.log("non sponsorizzato");
            this.notSponsored.push(el);
          }
        });

        this.users = [...this.sponsored, ...this.notSponsored];
        if (this.users.length === 0) {
          this.results = false;
        } else {
          this.results = true;
        }
      });
    },
    filterSpec: function () {
      if (this.specId > 0) {
        return axios
          .get(
            "http://127.0.0.1:8000/api/doctors?specialization=" + this.specId
          )
          .then((response) => {
            // data corrente
            let date = new Date();
            let currDate = Date.parse(date);
            // data scadenza sponsorizzazione
            var sponsDate;
            this.sponsored = [];
            this.notSponsored = [];

            let filtered = response.data.filter((el) => {
              if (el.sponsorships.length > 0) {
                el.sponsorships.forEach((spons) => {
                  sponsDate = Date.parse(spons.pivot.expiration_time);
                  if (currDate < sponsDate) {
                    console.log("sponsorizzato!!");
                    this.sponsored.push(el);
                  }
                });
              }
              if (el.sponsorships.length == 0) {
                console.log("non sponsorizzato");
                this.notSponsored.push(el);
              }
            });

            this.users = [...this.sponsored, ...this.notSponsored];
            if (this.users.length === 0) {
              this.results = false;
            } else {
              this.results = true;
            }
          });
      } else {
        return this.getAll();
      }
    },
    filterVote: function () {
      if (this.orderBy === "reviewsNum") {
        return this.sortUsers();
      }
      if (this.vote != 0) {
        this.users = this.users.filter((user) => {
          let media = this.average(user);
          if (media == this.vote) {
            return user;
          }
        });
        if (this.users.length === 0) {
          this.results = false;
        } else {
          this.results = true;
        }
      }
    },
    average: function (user) {
      let somma = 0;
      let n = 0;
      let media = 0;
      if (user.reviews.length > 0) {
        user.reviews.forEach((review) => {
          somma += review.rv_vote;
          n += 1;
        });
        return (media = Math.round(somma / n));
      }
    },
    sum: function (user) {
      let n = 0;
      if (user.reviews.length > 0) {
        user.reviews.forEach((el) => {
          n += 1;
        });
        return n;
      } else {
        return 0;
      }
    },
    sortUsers: function () {
      this.users = this.users.sort((a, b) => {
        return this.sum(b) - this.sum(a);
      });
    },
  },
};
</script>
