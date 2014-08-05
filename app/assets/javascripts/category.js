var Category = {
  bindEvents: function() {
    $('.categories-list').on('click', 'a', this.togglePosts);
  },

  togglePosts: function() {
    event.preventDefault();
    $(this).siblings('.posts-list').toggleClass('hidden');
  }
}

$(document).ready(function() {
  Category.bindEvents();
})
