From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:17:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcpprestsdk: bump to version
 2.10.16
In-Reply-To: <20200614213040.809936-1-aduskett@gmail.com>
References: <20200614213040.809936-1-aduskett@gmail.com>
Message-ID: <20200618221734.7cf8299a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jun 2020 14:30:40 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Remove upstream patch
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  ...sdk-fix-building-as-a-static-library.patch | 38 -------------------
>  package/libcpprestsdk/libcpprestsdk.hash      |  2 +-
>  package/libcpprestsdk/libcpprestsdk.mk        |  2 +-
>  3 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 package/libcpprestsdk/0001-libcpprestsdk-fix-building-as-a-static-library.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
