From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Sep 2019 19:21:25 +0200
Subject: [Buildroot] [PATCH v5] package/nfs-utils: enable IPv6
In-Reply-To: <20190911203344.7839-1-unixmania@gmail.com>
References: <20190911203344.7839-1-unixmania@gmail.com>
Message-ID: <20190912192125.4e168a19@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Wed, 11 Sep 2019 17:33:44 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> IPv6 requires libtirpc, so select BR2_PACKAGE_LIBTIRPC unconditionally.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=10806
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> CC: nathan.renniewaldock at gmail.com
> CC: Peter Seiderer <ps.report@gmx.net>
> CC: Arnout Vandecappelle <arnout@mind.be>
> CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> --
> Changes v1->v2
> - Select LIBTIRPC unconditionally.
> Changes v2->v3
> - Do not select libtirpc inconditionally
> Changes v3->v4
> - Restore v1 commit message
> - Add comment about selecting libtirpc to Config.in
> Changes v4->v5
> - Select LIBTIRPC unconditionally, again (back to v2)

Thanks a lot for providing this v5 which I applied. I have extended the
commit log quite a bit, to explain the reasoning and the conclusion of
our lengthy discussion.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
