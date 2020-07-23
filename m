From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 16:35:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/{openjdk,
 openjdk-bin}: bump to version 14.0.2+12
In-Reply-To: <20200721204958.3089846-1-aduskett@gmail.com>
References: <20200721204958.3089846-1-aduskett@gmail.com>
Message-ID: <20200723163555.44fd3d32@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Jul 2020 13:49:58 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/openjdk-bin/openjdk-bin.hash                          | 2 +-
>  package/openjdk-bin/openjdk-bin.mk                            | 4 ++--
>  .../{14.0.1+7 => 14.0.2+12}/0001-fix-gcc-10-support.patch     | 0
>  package/openjdk/openjdk.hash                                  | 2 +-
>  package/openjdk/openjdk.mk                                    | 4 ++--
>  5 files changed, 6 insertions(+), 6 deletions(-)
>  rename package/openjdk/{14.0.1+7 => 14.0.2+12}/0001-fix-gcc-10-support.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
