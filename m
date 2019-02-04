From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 17:07:20 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/bird: bump version to 2.0.3
In-Reply-To: <20190204152250.9012-1-adrien@gallouet.fr>
References: <20190204161524.291fff15@windsurf>
 <20190204152250.9012-1-adrien@gallouet.fr>
Message-ID: <20190204170720.2c21e50e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Feb 2019 15:22:51 +0000
Adrien Gallou?t <adrien@gallouet.fr> wrote:

> Patch 0001 is no longer needed as it has been ported to this version.
> Also, the README changes but the licence is still GPL-2.0+
> 
> Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
> ---
>  ...fix-installation-with-disable-client.patch | 41 -------------------
>  package/bird/bird.hash                        |  4 +-
>  package/bird/bird.mk                          |  6 +--
>  3 files changed, 4 insertions(+), 47 deletions(-)
>  delete mode 100644 package/bird/0001-Makefile.in-fix-installation-with-disable-client.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
