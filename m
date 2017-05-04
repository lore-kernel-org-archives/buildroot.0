From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:37:13 +0200
Subject: [Buildroot] [PATCH v9 0/7] e2fsprogs: refactor to fix conflicts
 with busybox and util-linux
In-Reply-To: <20170422224919.3257-1-arnout@mind.be>
References: <20170422224919.3257-1-arnout@mind.be>
Message-ID: <20170504223713.19433adb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Apr 2017 00:49:12 +0200, Arnout Vandecappelle

> Carlos Santos (7):
>   e2fsprogs: refactor to fix conflicts with busybox and util-linux
>   e2fsprogs: add help text for all config options
>   e2fsprogs: disable unneeded features for host
>   e2fsprogs: add explicit --enable/--disable configure options
>   e2fsprogs: avoid conflict with util-linux fsck wrapper
>   e2fsprogs: only add -lintl for static builds
>   e2fsprogs: add empty lines to .mk file

Entire series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
