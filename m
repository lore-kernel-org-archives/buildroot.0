From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2016 18:27:24 +0100
Subject: [Buildroot] [PATCH v5] valgrind: fix musl compile
In-Reply-To: <1455221824-8821-1-git-send-email-ps.report@gmx.net>
References: <1455221824-8821-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160213182724.4b30b3c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 11 Feb 2016 21:17:04 +0100, Peter Seiderer wrote:
> Add musl libc detection (based on suggestions by Romain Naour and
> Arnout Vandecappelle) and add some tweaks for musl support (based
> on OpenWRT patch [1]).
> 
> Fixes ([2]):
>   checking the glibc version... unsupported version
>   configure: error: Valgrind requires glibc version 2.2 or later
> 
> Patch suggested upstream (see [3]).
> 
> [1] https://dev.openwrt.org/browser/trunk/package/devel/valgrind/patches/200-musl_fix.patch?rev=46302
> [2] http://autobuild.buildroot.org/results/7b0/7b048ba58918f0a08498c61327fcf35a85a84837
> [3] https://bugs.kde.org/show_bug.cgi?id=359202
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v4 -> v5:
>   - add Reviewed-by

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
