From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Nov 2011 21:57:42 +0100
Subject: [Buildroot] commit bf4465 (ncurses: fix hanging installation
 due to old version of tic)
In-Reply-To: <CAHUNapT5XD1ghKZgfH1nVsiOEqpjfxUcTTHp5NCNa_C7+rEEJg@mail.gmail.com>
References: <CAHUNapT5XD1ghKZgfH1nVsiOEqpjfxUcTTHp5NCNa_C7+rEEJg@mail.gmail.com>
Message-ID: <20111124215742.7678dab4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 24 Nov 2011 15:47:23 -0500,
Trevor Woerner <twoerner@gmail.com> a ?crit :

> Now that ncurses depends on host-ncurses I was wondering if it also
> needs to depend on host-automake and/or host-pkg-config?
> 
> Could $(call AUTOTARGETS,host) be tweaked to automatically include
> host-automake implicitly?

It already does if <pkg>_AUTORECONF = YES.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
