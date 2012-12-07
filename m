From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 07 Dec 2012 11:32:24 +0100
Subject: [Buildroot] [PATCH] pkg-infra: add <pkg>-extract
 and	<pkg>-patch targets to OVERRIDE support
In-Reply-To: <874njy1x58.fsf@dell.be.48ers.dk>
References: <1354835760-9357-1-git-send-email-arnout@mind.be>
 <874njy1x58.fsf@dell.be.48ers.dk>
Message-ID: <50C1C5B8.2020505@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 07.12.2012 02:14, schrieb Peter Korsgaard:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> Hi,
>
>  Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>  Arnout> The legal-info target (and possibly others as well) depends on
>  Arnout> <pkg>-extract to make sure the license file is available.  However,
>  Arnout> when <PKG>_OVERRIDE_SRCDIR is active, the <pkg>-extract target
>  Arnout> doesn't exist.
>
>  Arnout> To solve this, we add <pkg>-extract which depends on <pkg>-rsync.
>  Arnout> While we're at it, we do the same for <pkg>-patch.  That avoids the
>  Arnout> same problem in the future if something starts depending on
>  Arnout> <pkg>-patch.
>
>  Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  Arnout> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Arnout> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
>
> Committed, thanks.
>
Thanks, now legal info works together with OVERRIDE.

Stephan


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
