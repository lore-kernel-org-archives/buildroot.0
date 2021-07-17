From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:02:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: install rpc.h
In-Reply-To: <20210716220941.347189-1-fontaine.fabrice@gmail.com>
References: <20210716220941.347189-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717100232.16a5fc8e@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 17 Jul 2021 00:09:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Install rpc.h to avoid the following build failure with host-nfs-utils
> in version 2.5.4 raised since commit
> 0ce30de72fb303768c5865949b8ce9260d0c43f5:
> 
> checking rpc/rpc.h usability... no
> checking rpc/rpc.h presence... no
> checking for rpc/rpc.h... no
> configure: error: Header file rpc/rpc.h not found - maybe try building with --enable-tirpc
> 
> This build failure is raised by
> http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=be7365239abf8556773b063730621967b9971708
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a5eaf19f58729c4c00a2131b6a0c378c0fc0effb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libtirpc/libtirpc.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
