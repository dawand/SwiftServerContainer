function Session(host) {
    var session = this;

    session.ws = new WebSocket('ws://' + host);
    
    session.ws.onopen = function() {
        session.output("started running", window.location.host);
    };


    session.ws.onmessage = function(event) {
        var message = JSON.parse(event.data);
        console.log('[' + name + '] ' + message);
        session.output(message.message, message.username);
    }

    session.output = function(message, username) {
        var output = $('<div>');

        var d = new Date()
        var m = '00'
        if (m != d.getMinutes()) {
            m = d.getMinutes();
        }

        if (m < 10) {
            m = '0' + m;
        }
        
        var time = $('<span>' + d.getHours() + ':' + m + ' </span>');
        output.append(time);
        
        var span = $('<span>');

        if (username) {
            span.text(username + ': ' + message);
        }

        output.append(span);

        $(".messages").append(output);

        var objDiv = $('.messages')[0];
        objDiv.scrollTop = objDiv.scrollHeight;
    }

};
