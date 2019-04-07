From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 22:21:24 +0200
Subject: [Buildroot] [RFC v3 3/4] libdrm: change to meson build system
In-Reply-To: <20180719204355.10465-3-ps.report@gmx.net>
References: <20180719204355.10465-1-ps.report@gmx.net>
 <20180719204355.10465-3-ps.report@gmx.net>
Message-ID: <20190407222124.65030c6d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 22:43:54 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - remove legacy patch
>   0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
> 
> - add patch to fix meson atomic ops detection
>   0003-meson.build-fix-intel-atomics-detection.patch
> 
> - add patch to enable static build
>   0004-meson.build-enable-static-build.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

It's been a while: could you refresh this patch on the latest master
and send a new version ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
