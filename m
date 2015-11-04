From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Wed, 04 Nov 2015 22:22:29 +0900
Subject: [Buildroot] [PATCH v4 1/1] gauche: new package
In-Reply-To: Your message of Wed, 04 Nov 2015 13:59:25 +0100.
 <20151104135925.36dc05dd@free-electrons.com>
Message-ID: <201511041322.tA4DMUM6028574@ms-omx02.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.

Thank you for your confirmation.
I will send V5 patch later.

Regards,
Kawashima

Thomas Petazzoni writes:
> Dear Hiroshi Kawashima,
> 
> On Wed, 04 Nov 2015 21:17:41 +0900, Hiroshi Kawashima wrote:
> 
> > # Detection of c99 support in configure fails without WCHAR. To enable
> > # automatic detection of c99 support by configure, we need to enable
> > # WCHAR in toolchain. But actually we do not need WCHAR at gauche runtime.
> > # So reuesting WCHAR in toolchain just for automatic detection will be
> > # overkill. To solve this, explicitly -std=gnu99 is specified here.
> 
> Looks good to me.
> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
============================================================
    Hiroshi Kawashima
