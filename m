From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 09:23:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/{openjdk,
 openjdk-bin}: bump to version 11.0.8+10
In-Reply-To: <20200715232948.1843405-1-aduskett@gmail.com>
References: <20200715232948.1843405-1-aduskett@gmail.com>
Message-ID: <20200716092306.6e25ab1d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 16:29:48 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/openjdk-bin/openjdk-bin.hash                            | 2 +-
>  package/openjdk-bin/openjdk-bin.mk                              | 2 +-
>  .../{11.0.7+10 => 11.0.8+10}/0001-fix-gcc-10-support.patch      | 0
>  package/openjdk/openjdk.hash                                    | 2 +-
>  package/openjdk/openjdk.mk                                      | 2 +-
>  5 files changed, 4 insertions(+), 4 deletions(-)
>  rename package/openjdk/{11.0.7+10 => 11.0.8+10}/0001-fix-gcc-10-support.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
