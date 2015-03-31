From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 17:15:17 -0300
Subject: [Buildroot] (gtk)webkit 2.x anyone ?
In-Reply-To: <551AD244.1000900@proximus.be>
References: <551ABEA0.8080808@proximus.be>
 <20150331174344.31147123@free-electrons.com>
 <551ACBB1.7010808@zacarias.com.ar> <551AD244.1000900@proximus.be>
Message-ID: <551B0055.5010702@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/31/2015 01:58 PM, Johan Sagaert wrote:
> Hi Gustavo , all ,
> 
> Thanks for the info, this seems a huge effort , not sure if this : could
> serve you any help :
> https://github.com/Metrological/buildroot
> Came across this, but did not dive into it.

From a quick look it seems somewhat useless, they've focused on their
side of things (webkitgtk-shell) without considering anything else like
midori.
They're also using some snapshot version.

> There are so many dependencies and there is always to a chance to break
> something else
> that depends on these.
> I want a fullscreen html5 (+ websockets ) capable browser,and a virtual
> keyboard
> (matchbox-keyboard) that pop-ups when the focus is in a text field .....

Well, that's why it needs so much work :)

> I tried the qt5-kiosk package ,but for some reason is very slow.
> (platform is imx6 dual lite  )
> I did run the Qt5-cinematice experience demo, and that runs smooth, it
> seems to push
> the GPU to its limits , yielding a GPU too hot warning, but it proves
> graphical accel. is working.

I dunno if you'll get better results with gtk+, a full ARM target image
is ~270 MB with X11-modular and matchbox.

> So i am wiling to test-drive if you have something to play with.

At this point in time what i've got is a PoC qemu test image, the
packaging and cleanup part is going along - however feature-wise it's
still very lacking.
Regards.
