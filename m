From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 18:34:29 +0100
Subject: [Buildroot] [PATCH] uclibc: fix ARC compile
In-Reply-To: <1395431122-25969-1-git-send-email-ps.report@gmx.net>
References: <1395431122-25969-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140329183429.20cf05c2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Fri, 21 Mar 2014 20:45:22 +0100, Peter Seiderer wrote:
> Add patch [1,2] to fix ARC uclibc snapshot compile (as suggested by
> Baruch Siach [3]).
> 
> Fixes ARC uclibc compile failure ([4]) posix_fadvise/off64_t related.
> 
> [1] http://thread.gmane.org/gmane.comp.lib.uclibc.general/23714
> [2] http://patchwork.ozlabs.org/patch/308533/mbox/
> [3] http://lists.busybox.net/pipermail/buildroot/2014-March/092512.html
> [4] http://lists.busybox.net/pipermail/buildroot/2014-March/092506.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
