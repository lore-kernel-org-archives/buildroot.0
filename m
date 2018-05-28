From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 May 2018 23:30:34 +0200
Subject: [Buildroot] [PATCH] package/corkscrew: new package
In-Reply-To: <1524751837-32018-1-git-send-email-angelo@amarulasolutions.com>
References: <1524751837-32018-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180528233034.246de8e9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Apr 2018 16:10:37 +0200, Angelo Compagnucci wrote:
> Corkscrew is a tool for tunneling SSH through HTTP proxies
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/Config.in                |  1 +
>  package/corkscrew/Config.in      |  7 +++++++
>  package/corkscrew/corkscrew.hash |  2 ++
>  package/corkscrew/corkscrew.mk   | 13 +++++++++++++
>  4 files changed, 23 insertions(+)
>  create mode 100644 package/corkscrew/Config.in
>  create mode 100644 package/corkscrew/corkscrew.hash
>  create mode 100644 package/corkscrew/corkscrew.mk

I've applied to next, but after adding an entry in the DEVELOPERS
file, and the hash of the license file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
