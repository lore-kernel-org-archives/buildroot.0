From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 23:42:42 +0200
Subject: [Buildroot] [PATCH v2] pkg-infra: add <pkg>-extract and
 <pkg>-patch targets to OVERRIDE support
In-Reply-To: <1350249558-21276-1-git-send-email-arnout@mind.be>
References: <20121014230622.44a6d420@skate>
 <1350249558-21276-1-git-send-email-arnout@mind.be>
Message-ID: <20121014234242.12894aa0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sun, 14 Oct 2012 23:19:18 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The legal-info target (and possibly others as well) depends on
> <pkg>-extract to make sure the license file is available.  However,
> when <PKG>_OVERRIDE_SRCDIR is active, the <pkg>-extract target
> doesn't exist.
> 
> To solve this, we add <pkg>-extract which depends on <pkg>-rsync.
> While we're at it,we do the same for <pkg>-patch.  That avoids the
> same problem in the future if something starts depending on
> <pkg>-patch.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
