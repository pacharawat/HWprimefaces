(function($) {
    $(function() {
        $('a').on('click', function(event) {
            var $tr = $(this).parents('tr');
            var data = [];
            $tr.children('td').each(function() {
                var text = $(this).text().trim();
                if (text !== 'show data') {
                    data.push(text);
                }
            });

            alert(data.join(', '));
        });

        $('.clear-button').on('click', function() {
            $('[name=q]').val('');
        });
        
        var hiddenValue = $('[type=hidden]').val();
        $('[name=search_by] option').prop('selected', false)
                   .filter('[value="' + hiddenValue + '"]')
                   .prop('selected', true);
    });
})(jQuery);