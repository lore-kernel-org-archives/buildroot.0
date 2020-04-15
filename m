From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 22:00:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/strace: fix build without fork
In-Reply-To: <20200414115641.1374238-1-fontaine.fabrice@gmail.com>
References: <20200414115641.1374238-1-fontaine.fabrice@gmail.com>
Message-ID: <20200415220011.28b6aa24@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Apr 2020 13:56:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/ffc81d3798379a9c34c7a708ebbdea27409f755d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...yscall_info.c-fix-build-without-fork.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/strace/0001-ptrace_syscall_info.c-fix-build-without-fork.patch

Applied to master, thanks. I've even updated the upstream status of the
patch, since it was applied upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
