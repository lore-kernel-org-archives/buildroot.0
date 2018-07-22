From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 22 Jul 2018 14:28:24 +0200
Subject: [Buildroot] [RFC v3 3/4] libdrm: change to meson build system
In-Reply-To: <20180719204355.10465-3-ps.report@gmx.net>
References: <20180719204355.10465-1-ps.report@gmx.net>
 <20180719204355.10465-3-ps.report@gmx.net>
Message-ID: <20180722122824.GC9618@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-07-19 22:43, Peter Seiderer wrote:
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
Tested-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

--
ELB
