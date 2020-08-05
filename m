From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:21:17 +0200
Subject: [Buildroot] [PATCH] package/sam-ba: bump to version 3.3.1
In-Reply-To: <20200801142243.393956-1-angelo@amarulasolutions.com>
References: <20200801142243.393956-1-angelo@amarulasolutions.com>
Message-ID: <20200805152117.0dbb2e00@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Aug 2020 16:22:43 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> sam-ba tool moved to github, changed license to GPLv2 and dropped x86
> support.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/sam-ba/Config.in.host |  2 +-
>  package/sam-ba/sam-ba.hash    |  6 ++----
>  package/sam-ba/sam-ba.mk      | 26 ++++++--------------------
>  3 files changed, 9 insertions(+), 25 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
