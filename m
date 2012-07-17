From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 09:32:12 +0200
Subject: [Buildroot] Qt on AM3517EVM
In-Reply-To: <CALo-6+hhvCkfT_4Rz4POqw5j_BPPLKHZ0saqEyeiKsp-tSJLdA@mail.gmail.com>
References: <CALo-6+hhvCkfT_4Rz4POqw5j_BPPLKHZ0saqEyeiKsp-tSJLdA@mail.gmail.com>
Message-ID: <20120717093212.0c7d5415@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Jul 2012 10:40:23 -0700,
Charles Krinke <charles.krinke@gmail.com> a ?crit :

> First of all, +100 for Thomas, Arnout and Julian. This morning, I was
> able to load the jffs2 compiled file system from buildroot and run
> "ts_calibrate" and got a functioning touch screen and color LCD with
> Qt on the LogicPD AM3517EVM after *removing* the environment variable
> QMAKESPEC which the TI-SDK insisted on adding to my .bashrc.

Great.

> Of course, no sooner had I gotten it to work then my customer says
> "Thats cool, how about Qt5?"
> 
> So, ... are we considering either a Qt5 bump or either Qt4/Qt5 with an
> xconfig option?

I think Qt5 needs a separate package from qt4, because many, many
things have changed in Qt5. Also Qt5 apparently requires an OpenGL
renderer, which wasn't the case in Qt4, so we will probably be keeping
Qt4 around for quite a while for low-end platforms.

Anyone willing to work on packaging Qt5 is definitely more than welcome
to contribute such effort.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
