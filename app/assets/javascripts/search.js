var gitSearch = {
  typingTimer: null,

  doneTypingInterval: function(){
    return 1000
  },

  previousSearchValue: null,

  bindSeachFieldKeyup: function(){
    var self = this
    $("#search").on("keyup", function(){
      if(self.previousSearchValue != $(this).val()){
        var q = $(this).val()
        self.previousSearchValue = $(this).val()
        clearTimeout(self.typingTimer);
        self.typingTimer = setTimeout(function(){
          self.searchPublicRepositoris(q);
        }, self.doneTypingInterval());
      }
    });
  },

  bindSeachFieldKeydown: function(){
    var self = this;
    $("#search").on("keydown", function(){
      clearTimeout(self.typingTimer);
    });
  },

  bindPaginationLink: function(){
    var self = this;
    $(document).on("click", ".paginate a", function(){
      self.showOrHideContentWhileWaiting();
    });
  },

  searchPublicRepositoris: function(q){
    this.showOrHideContentWhileWaiting();
    $.ajax({
      type: "GET",
      url: "/search",
      data: {q: q},
      dataType: "script"
    });
  },

  showOrHideContentWhileWaiting: function(){
    $("#loader").removeClass("hide");
    $("#search-results").addClass("hide");
    $("#pagination").addClass("hide");
  },

  documentOnReady: function(){
    this.bindSeachFieldKeyup();
    this.bindSeachFieldKeydown();
    this.bindPaginationLink();
  }
}

$( document ).ready(function() {
  gitSearch.documentOnReady();
});
