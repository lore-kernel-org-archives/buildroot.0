From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 15:45:42 +0200
Subject: [Buildroot] [PATCH] package/gdb: gdbserver: add missing header
In-Reply-To: <1469276099-13936-1-git-send-email-romain.naour@gmail.com>
References: <1469276099-13936-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160724154542.16d7d612@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 14:14:59 +0200, Romain Naour wrote:
> Backport upstream patch for musl toolchains
> 
> Fixes:
> http://autobuild.buildroot.net/results/564/56443134388ee6c4a13add10cc53eff6f47f244e
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../7.10.1/0005-target.h-include-sys-types.h.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/gdb/7.10.1/0005-target.h-include-sys-types.h.patch

Applied to master, thanks. Is this patch also needed for gdb 7.9 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
