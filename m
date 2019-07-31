From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Jul 2019 09:25:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/host-mtd: fixes build
In-Reply-To: <1564402300-3993-1-git-send-email-julien.boibessot@free.fr>
References: <1564402300-3993-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20190731092534.31da3132@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

The commit title should rather be:

	package/mtd: add host-zstd dependency to host variant to fix build

On Mon, 29 Jul 2019 14:11:40 +0200
julien.boibessot at free.fr wrote:

> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> Fixes following build error when Host doesn't have zstd devt files:

This should also mention that the issue was introduced in the commit
bumping to 2.1.1, and add references to the autobuilder failures.

However, why does this problem only occurs for the host variant, and
not the target variant.

Why is this warning causing a build failure ? Normally warnings are
just warnings, not errors.

Is this zstd dependency optional somehow ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
