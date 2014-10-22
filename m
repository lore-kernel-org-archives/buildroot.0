From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 21:09:46 +0200
Subject: [Buildroot] [PATCH] util-linux: use configure option instead of
 patching makefile
In-Reply-To: <1413919956-31413-1-git-send-email-ps.report@gmx.net>
References: <1413919956-31413-1-git-send-email-ps.report@gmx.net>
Message-ID: <20141022210946.1db07ed0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 21 Oct 2014 21:32:36 +0200, Peter Seiderer wrote:
> Use --disable-all-programs configure option instead of sed base
> patching of Makefile.am in case no util-linux binaries are selected.
> 
> Suggested by Thomas Petazzoni ([1]).
> 
> With this patch applied the following libs are no longer build by default:
> 
> util-linux-2.25.1/.libs/libfdisk.a
> util-linux-2.25.1/.libs/libsmartcols.a
> util-linux-2.25.1/.libs/libsmartcols.so.1.1.0
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2014-October/109818.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/util-linux/util-linux.mk | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
