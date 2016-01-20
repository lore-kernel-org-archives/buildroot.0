From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Wed, 20 Jan 2016 14:32:23 +0100
Subject: [Buildroot] Browser in kiosk mode
In-Reply-To: <569F8B19.5010304@zacarias.com.ar>
References: <569F7F6A.4060906@gmail.com> <569F8B19.5010304@zacarias.com.ar>
Message-ID: <569F8C67.3010709@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 20/01/2016 14:26, Gustavo Zacarias ha scritto:
> You can do that with any browser using squid in transparent mode with 
> a whitelist, that way you're not tied to any particular solution 
> (plugin, addon).
> Regarding which browser to use that will probably depend on which 
> features you want/need and which graphics platform you want to run it 
> on (example: X11, pure framebuffer, EGL, so on).


Interesting, thanks!
The best would be to run in framebuffer or eglfs because I already have 
a working environment.
About the features, I think it should run javascripts and flash contents 
because most websites use them. Of course, because the whitelist, we 
will allow only trusted websites.

How do you think to avoid the user to change options?
