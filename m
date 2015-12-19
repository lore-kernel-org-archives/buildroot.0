From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:22:23 +0100
Subject: [Buildroot] [PATCH v1] valgrind: fix musl compile
In-Reply-To: <1446317942-18726-1-git-send-email-ps.report@gmx.net>
References: <1446317942-18726-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151219142223.2d0bb215@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sat, 31 Oct 2015 19:59:02 +0100, Peter Seiderer wrote:
> Add patch disabling glibc version check and adding some tweaks
> for musl support (based on OpenWRT patch [1]).
> 
> Fixes ([2]):
>   checking the glibc version... unsupported version
>   configure: error: Valgrind requires glibc version 2.2 or later
> 
> [1] https://dev.openwrt.org/browser/trunk/package/devel/valgrind/patches/200-musl_fix.patch?rev=46302
> [2] http://autobuild.buildroot.org/results/7b0/7b048ba58918f0a08498c61327fcf35a85a84837/build-end.log
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

You have been given a number of comments on this patch. Could you rework
to take into account the comments and send an updated version?

Note that you can also find some musl compatibility patches at
http://git.alpinelinux.org/cgit/aports/tree/main/valgrind/.

In the mean time, I'll mark your patch as Changes Requested in
patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
