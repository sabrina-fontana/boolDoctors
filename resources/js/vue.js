const app = new Vue({
    el: '#app',
    methods: {
        historyBack(spec) {
            window.location.href = '/doctors?specialization=' + spec;
        },
    }
});
