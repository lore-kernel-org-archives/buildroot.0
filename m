From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 13:59:25 +0100
Subject: [Buildroot] [meiwaku] Re:  [PATCH v4 1/1] gauche: new package
In-Reply-To: <201511041217.tA4CHfYU006745@ms-omx03.plus.so-net.ne.jp>
References: <20151102165016.62635bd0@free-electrons.com>
 <201511041217.tA4CHfYU006745@ms-omx03.plus.so-net.ne.jp>
Message-ID: <20151104135925.36dc05dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On Wed, 04 Nov 2015 21:17:41 +0900, Hiroshi Kawashima wrote:

> # Detection of c99 support in configure fails without WCHAR. To enable
> # automatic detection of c99 support by configure, we need to enable
> # WCHAR in toolchain. But actually we do not need WCHAR at gauche runtime.
> # So reuesting WCHAR in toolchain just for automatic detection will be
> # overkill. To solve this, explicitly -std=gnu99 is specified here.

Looks good to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
