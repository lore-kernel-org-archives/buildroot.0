From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:43:56 +0200
Subject: [Buildroot] [PATCH] package/mono> fixing licenses hashes
In-Reply-To: <1528189868-4119-1-git-send-email-angelo@amarulasolutions.com>
References: <1528189868-4119-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180605184356.73c1f35a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jun 2018 11:11:08 +0200, Angelo Compagnucci wrote:
> This patch adds hashes for the licensing files and removes a file
> no more present.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c69e55a3f7539ff65aaf57c96f52ebea7e456e48/
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

This should have been split in two patches, because there are really
two different things happening here: fixing the license files variable
following the last Mono bump, and adding license file hashes.

So I've split into two patches, added a bit more details about the
license files fix so that Peter knows whether it should be backported
to a stable branch (it should not), and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
