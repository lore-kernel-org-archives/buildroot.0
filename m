From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Dec 2009 23:43:40 +0100
Subject: [Buildroot] SYSROOT_DIR issue with external toolchains
In-Reply-To: <5f2b60912141113n33fa36f1mdd45dc55313301c3@mail.gmail.com>
References: <5f2b60912141113n33fa36f1mdd45dc55313301c3@mail.gmail.com>
Message-ID: <20091214234340.714eb09b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 14 Dec 2009 20:13:44 +0100,
Bj?rn Forsman <bjorn.forsman@gmail.com> a ?crit :

> SYSROOT_DIR=$(shell $(TARGET_CC) -print-sysroot)
> 
> Is there any problem with this change?

Yes, it doesn't work with all gcc versions.

I have
http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=2907415d82b7d306ca3f1f1ead0bbb0c7f1505c3
in my patch queue. Something I should clean up, test and submit.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
