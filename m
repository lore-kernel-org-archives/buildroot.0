From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:22:33 +0200
Subject: [Buildroot] [PATCH] package/swupdate: Fix to document proper
 LIBCURL name
In-Reply-To: <20190930054850.11039-1-jagan@amarulasolutions.com>
References: <20190930054850.11039-1-jagan@amarulasolutions.com>
Message-ID: <20190930222233.28b14dab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Sep 2019 11:18:50 +0530
Jagan Teki <jagan@amarulasolutions.com> wrote:

> Config.in documented BR2_LIBCURL for swupdate but the actual
> package name is BR2_PACKAGE_LIBCURL
> 
> Fix by updating the same in Config.in
> 
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  package/swupdate/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
