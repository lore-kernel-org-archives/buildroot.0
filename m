From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2009 13:20:39 +0200
Subject: [Buildroot] checking for XFT... configure: error: *** Required
 xft Librarys not found ***
In-Reply-To: <711BBECDEF81BA439A6038E213C1DF1406E16C93@ism-mail03.corp.ad.wrs.com>
References: <711BBECDEF81BA439A6038E213C1DF1406E16C93@ism-mail03.corp.ad.wrs.com>
Message-ID: <20090722132039.5f5c691f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Jul 2009 09:29:32 +0200,
"Franchitti, Alexandre J (Alex)" <alexandre.franchitti@windriver.com> a
?crit :

> I keep hitting this build error related to building the
> matchbox-keyboard-0.1 component:
> checking for FAKEKEY... yes
> checking for XFT... configure: error: *** Required xft Librarys not
> found ***
> make: ***
> [/folk/alexf/arm_linux/buildroot-2009.05/build_arm/matchbox-keyboard-0.1
> /.configured] Error 1
> 
> I believe I enabled everything I had to in order to get xft support
> but it still won't fly. I even tried to disable keyboard support to
> move ahead, but obviously, this is enabled by default when the
> BR2_PACKAGE_MATCHBOX is enabled so I don't have a choice but get it
> working. Note that I have auto-apt enabled also.

I've fixed the Matchbox build after 2009.05 release. It was fixed by
http://git.buildroot.net/buildroot/commit/?id=51ef5b81224c243aa7f937c4690b1a120c81ccbc

This commit is not yet part of a stable release. So either pick the
latest Git development version, of manually apply the patch to the
2009.05 version.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
