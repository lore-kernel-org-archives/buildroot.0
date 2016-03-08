From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:18:34 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/connman: fix crash due to
 iptables 1.6.0 update
In-Reply-To: <1457345950-2793-1-git-send-email-martin@barkynet.com>
References: <1457345950-2793-1-git-send-email-martin@barkynet.com>
Message-ID: <20160308211834.5d768caa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Mon,  7 Mar 2016 10:19:10 +0000, Martin Bark wrote:
> iptables was updated to version 1.6.0 in commit
> https://git.busybox.net/buildroot/commit/?id=35dc775 however, connman
> 1.31 crashes when iptables 1.6.0 is used.
> 
> This issues has already been fixed upstream but is not currently available
> in a release.  To fix connman include the upstream patch. See
> http://git.kernel.org/cgit/network/connman/connman.git/commit/?id=acea08a
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> ---

Applied to master, thanks. Since you already contributed this patch to
connman, could you also submit upstream the patch
package/connman/0001-configure-check-for-execinfo.h.patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
