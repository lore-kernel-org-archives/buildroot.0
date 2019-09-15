From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 16:10:35 +0200
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: simplify Git
 commit id retrieval
In-Reply-To: <20190912165522.8307-1-thomas.petazzoni@bootlin.com>
References: <20190912165522.8307-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190915161035.4fc572d8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Sep 2019 18:55:22 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> As suggested by Baruch Siach, using "git rev-parse HEAD" is a lot
> simpler than playing around with "git log" to just retrieve the commit
> id corresponding to the current HEAD.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/pkg-stats | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
