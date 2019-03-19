
<!DOCTYPE html>
<html>
<head>
    <title>My App</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="app.min.css">
    <style>
        /* TODO */

        @-webkit-keyframes pulse {
            0% {
                background-color: #CCC;
            }
            25% {
                background-color: #EEE;
            }
            50% {
                background-color: #CCC;
            }
            75% {
                background-color: #EEE;
            }
            100% {
                background-color: #CCC;
            }
        }

        .scroll-page .loading {
            margin: 12px auto;
            border: 8px solid #AAA;
            height: 16px;
            width: 16px;
            background: #CCC;
            border-radius: 16px;
            -webkit-animation: pulse 2s ease-in-out 0s infinite;
        }

    </style>
</head>

<body>
    <div class="app-page" data-page="home">
        <div class="app-topbar blue">
            <div class="app-title">Send An Email</div>
        </div>
        <div class="app-content">
            <p class="app-section">
                Click below to send a email
            </p>


            <div class="app-section" id="contactlist">
            </div>
            <div class="app-section">
                <div class="app-button" id="new-user">Send To New User</div>
            </div>
        </div>
    </div>
    <div class="app-page" data-page="sendemail">
        <div class="app-topbar">
            <div class="app-title"><span class="app-icon"></span>Send Email</div>
            <div class="right app-button" data-back>Done</div>
        </div>

        <div class="app-content">

          <div class="app-section" id="message"></div>
            <div class="app-section">
                From : <input class="app-input" placeholder="Sender Email" id="sender-email">
            </div>
            <div class="app-section">
                To : <input class="app-input" placeholder="Recipient Email" id="recipient-email">
            </div>

            <form class="app-section">
                <input class="app-input" name="subject" placeholder="Subject" id="subject">
                <textarea class="app-input" name="message" placeholder="Message" id="content"></textarea>
                <div class="app-button green app-submit" id="send-button">Send</div>
            </form>
        </div>
    </div>
    <script src="zepto.js"></script>
    <script src="app.min.js"></script>
    <script>
        App.controller('home', function(page) {
          
          

            if (typeof localStorage != "undefined") {

                $(page).find("#new-user").clickable().click(function() {

                    if (localStorage.getItem("sender-email") != null) {
                        localStorage.removeItem("recipient-email");
                    }
                    App.load("sendemail");
                })

                if (localStorage.getItem("sender-email") != null) {
                    var recipient = JSON.parse(localStorage.getItem("recipient-list"));

                    $.each(recipient, function(index, value) {
                        $(page).find("#contactlist").append('<div class="app-button redirect">' + value + '</div>')
                    });
                    $(page).find("#contactlist").show();

                    $(page).find(".redirect").clickable().on("click", function() {

                        localStorage.setItem("recipient-email", $(this).html());

                        App.load("sendemail");
                    })

                } else {
                    $(page).find("#contactlist").hide();
                }
            }

        });

        App.controller('sendemail', function(page) {

           $(page).find("#message").hide();
          
            if (typeof localStorage != "undefined") {
                if (localStorage.getItem("sender-email") != null) {
                    $(page).find("#sender-email").val(localStorage.getItem("sender-email"));
                }

                if (localStorage.getItem("recipient-email") != null) {
                    $(page).find("#recipient-email").val(localStorage.getItem("recipient-email"));
                }
            }

            $(page).find('#send-button')
                .clickable()
                .on('click', function() {     
               $.ajax({
  type: 'GET',
  url: 'http://vijethvk11-com.stackstaging.com/appjs/sendemail.php?callback=response',
  // data to be added to query string:
  data: { to: $("#recipient-email").val(),subject: $("#subject").val(),from: $("#sender-email").val(),message: $("#content").val() },
  
  dataType: 'jsonp',
  timeout: 300,
  context: $('body'),
  success: function(data){
    
   if(data.success == true){
   $(page).find("#message").html("Your Email was sent successfully").show();
     alert(data.success);
   }else{
     $(page).find("#message").html("Something Wrong please try again later!").show();
     alert(data.success);
   }
  },
  error: function(xhr, type){
     $(page).find("#message").html("Something Wrong please try again later!").show();
  }
})

                    if (typeof localStorage != "undefined") {
                        localStorage.setItem("sender-email", $("#sender-email").val());


                        var recipient = new Array();

                        if (localStorage.getItem("recipient-list") != null) {

                            recipient = JSON.parse(localStorage.getItem("recipient-list"));
                        }

                        if ($.inArray($("#recipient-email").val(), recipient) == -1) {

                            recipient.push($("#recipient-email").val());
                            recipient.sort();
                            localStorage.setItem("recipient-list", JSON.stringify(recipient));
                            console.log(recipient);
                        }


                    }

                });

        });


        try {
            App.restore();
        } catch (err) {
            App.load('home');
        }

    </script>
</body>

</html>
