From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Tue, 08 Jul 2014 16:23:57 +0200
Subject: [Buildroot] [PATCH 0/14 v3] freescale: update userspace
 packages (branch yem/fsl-imx)
In-Reply-To: <CADCpmyPmcqdGYG1oHVPRag_5D_us5mb6xu_+GKpjHnG7ftF0ig@mail.gmail.com>
References: <cover.1404164261.git.yann.morin.1998@free.fr>	<53BAB7CA.9000603@gmail.com>	<CADCpmyOEGFGsuExD4mskncbqRJBxDoHy6CbqtyZ0TRjEKGqjNQ@mail.gmail.com>
 <CADCpmyPmcqdGYG1oHVPRag_5D_us5mb6xu_+GKpjHnG7ftF0ig@mail.gmail.com>
Message-ID: <53BBFEFD.6070609@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Mon, 7 Jul 2014 23:46:46 -0700, Gary Bisson wrote:
[...]
> 
>         Gary, did you have time to test this series? When I tested your
>         previous
>         series I was able to run some tutorialX demo programs, but they was
>         quite weird and ugly (black and white with strips), and now I
>         can't run
>         anything with this series.
>         I didn't test the VPU for now.
> 
>         If it works for you, could you provide a defconfig so that I can
>         look
>         what I'm missing?
> 
>      
>     The latest series I've tested is my PATCHv2 one, I will do it on
>     Yann's asap but in the meantime here is the defconfig I was using.
>     When you say it is not working, could you tell me more (nothing on
>     the screen, seg fault etc..)?

tutorialX demos just return immediately (nothing on the screen, no
messages) and es_20 demos (vv_launcher ant tutorialX_es20) segfault.

>     Do you see the FPS average on the serial output? (at least tutorial7
>     is printing that info)

I did with v2 series, but not with v3.

>     Could you send your dmesg?
>     What platform are you using?
>     What kind of display?

I'm testing on a Wandboard rev. A0 with an HDMI display. I will try on a
Sabre as soon as possible too.

I don't have a dmesg log right now.

> I confirm that GPU works fine using Yann's branch yem/fsl-imx. Please
> find attached the config I've used for both kernel and buildroot.

OK, great news! So I missed something. I will look at your configs and
try a new build, thank you.

> Regarding VPU test, I was running out of time but I'm confident this
> will work as well, gst-inspect reports fsl plugins properly (I was just
> missing the actual media file at the time of the testing). I'll try it
> tomorrow and let you know if any issue, otherwise consider it working.
> As before I was using a nitrogen6x, this time with a HDMI monitor but
> previous tests have been run on LVDS display.
> Let me know if you need more information.

Thanks!

Hadrien
