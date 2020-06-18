From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:17:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/sngrep: bump to version 1.4.7
In-Reply-To: <20200614213824.939388-1-aduskett@gmail.com>
References: <20200614213824.939388-1-aduskett@gmail.com>
Message-ID: <20200618221738.04cbd438@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jun 2020 14:38:24 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Remove upstream patch
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  ...0001-capture-fix-typo-in-FILE-object.patch | 43 -------------------
>  package/sngrep/sngrep.hash                    |  8 ++--
>  package/sngrep/sngrep.mk                      |  2 +-
>  3 files changed, 5 insertions(+), 48 deletions(-)
>  delete mode 100644 package/sngrep/0001-capture-fix-typo-in-FILE-object.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
