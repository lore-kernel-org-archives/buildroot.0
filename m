From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Tue, 31 Mar 2015 18:58:44 +0200
Subject: [Buildroot] (gtk)webkit 2.x anyone ?
In-Reply-To: <551ACBB1.7010808@zacarias.com.ar>
References: <551ABEA0.8080808@proximus.be>
 <20150331174344.31147123@free-electrons.com>
 <551ACBB1.7010808@zacarias.com.ar>
Message-ID: <551AD244.1000900@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo Zacarias schreef op 31/03/2015 om 18:30:
> On 03/31/2015 12:43 PM, Thomas Petazzoni wrote:
>>> Anyone busy writing patches to get a recent webkit in buildroot ?
>>> (The current one in buildroot crashes  (GtkLaucher) )
>> Yes, Gustavo is working on it.
> Quick status is it's working but not yet completely clean to submit.
> Lacking: JIT (completely disabled until i can test & narrow down the
> combinations for it) and any *GL* acceleration (no spare/useful hardware
> to test).
> Details: midori 0.5.9 & webkit-gtk 2.4.8, can't use anything newer so
> easily because the API changed and midori isn't compatible.
> gtk2 & gtk3 working (gtk2 is always required, with webkit-gtk 2.6+ it
> can be ditched but you loose plugin ability with that option).
> I'm pondering packaging separate versions of webkit-gtk and adding
> epiphany (now known as just "web") that can use the newer version, in
> theory with almost no gnome-proper dependencies.
> Thomas has being applying my assorted patches that are leading to this,
> but it's still some work away from being submission-ready.
> And it's being done in free time, so don't hold your breath.
> Regards.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
Hi Gustavo , all ,

Thanks for the info, this seems a huge effort , not sure if this : could 
serve you any help :
https://github.com/Metrological/buildroot
Came across this, but did not dive into it.

There are so many dependencies and there is always to a chance to break 
something else
that depends on these.
I want a fullscreen html5 (+ websockets ) capable browser,and a virtual 
keyboard
(matchbox-keyboard) that pop-ups when the focus is in a text field .....

I tried the qt5-kiosk package ,but for some reason is very slow.
(platform is imx6 dual lite  )
I did run the Qt5-cinematice experience demo, and that runs smooth, it 
seems to push
the GPU to its limits , yielding a GPU too hot warning, but it proves 
graphical accel. is working.

So i am wiling to test-drive if you have something to play with.

Best Regards,  Johan
