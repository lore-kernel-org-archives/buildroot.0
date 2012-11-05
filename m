From: Alexander Khryukin <alexander@mezon.ru>
Date: Mon, 5 Nov 2012 11:10:26 +0300
Subject: [Buildroot] new perl build issue
In-Reply-To: <20121105075317.75f9f85c@skate>
References: <CABtOAfw6A4jH1h1W1Bbm7kKsmz_hJLymP8JRBo5A6a4o09wS8g@mail.gmail.com>
 <CAB0FRstkx1+Eg0WTv4eVJ+KPFX9RY2C8X4SaL0EDoBK0P642SQ@mail.gmail.com>
 <20121105075317.75f9f85c@skate>
Message-ID: <CABtOAfyXrgHyg2ggDJvYXExhU4RMabsOVRXfAkE0p9+bnGVrZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/5 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>
> On Sun, 4 Nov 2012 20:41:45 +0100, Fran?ois Perrad wrote:
>
> > this afternoon, Thomas has posted 3 patches for qemu (see
> > http://patchwork.ozlabs.org/patch/197055/).
> > Alexander, try to rebuild host-qemu with them.
>
> Unfortunately, none of those patches have a chance to fix Alexander's
> problem. My patches only fix missing dependencies.
>
> Also, could you have a look at http://autobuild.buildroot.org/ for perl
> build failures? It seems like Qemu doesn't start properly on some
> platforms, for some reason.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>


I applied your patch but looks it not helps me.

http://pastie.org/5188031
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121105/5b9893a8/attachment.html>
