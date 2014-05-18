From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 18 May 2014 19:40:53 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
 <20140517205500.GL3459@free.fr>
 <0sjm4bxrs4.ln2@ID-313208.user.individual.net>
 <20140518162900.GA3631@free.fr>
 <le5n4bxjvb.ln2@ID-313208.user.individual.net>
 <20140518172928.GD3631@free.fr>
Message-ID: <5u7n4bxiil.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20140518172928.GD3631 at free.fr:

> Of course, this would probably not scale if we were to support it on
> other archs (eg. PPC), but it will be time to revisit this if/when we
> happen to add that support.

Hi,

compiling for ppc and mips was already successful here, it takes only some 
extensions for the xbmc build system and one patch for ldt_keeper.c.

I do not plan to extend my patch series with these archs now, but we should 
have them in mind, it may happen earlier then you might have thaught ;)

Regards, Bernd
