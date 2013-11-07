From: Andi Shyti <andi@etezian.org>
Date: Thu, 7 Nov 2013 02:19:08 +0100
Subject: [Buildroot] [PATCH] gcc: use generic infrastructure for patches
In-Reply-To: <1383778795-15262-1-git-send-email-arnout@mind.be>
References: <527AB58A.9050506@mind.be>
 <1383778795-15262-1-git-send-email-arnout@mind.be>
Message-ID: <20131107011908.GC3920@jack.whiskey>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> This solves the patch error for gcc snapshots.
> 
> Also sneak in an extra condition when applying the powerpc softfloat patch,
> so that the error is really fixed.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

works fine, just tested it.
If this is going to be applied, please feel free to add:

Tested-by: Andi Shyti <andi@etezian.org>
