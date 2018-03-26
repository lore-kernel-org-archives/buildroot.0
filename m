From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 21:51:50 +0200
Subject: [Buildroot] [PATCH] libgpg-error: bump to version 1.28
In-Reply-To: <01302e920974bda973279d5bad696cfee3aef1b6.1522093574.git.baruch@tkos.co.il>
References: <01302e920974bda973279d5bad696cfee3aef1b6.1522093574.git.baruch@tkos.co.il>
Message-ID: <20180326215150.2cdc48d7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Mar 2018 22:46:14 +0300, Baruch Siach wrote:
> Add upstream patch fixing arm/arm64 targets build failure.
> 
> Use the smaller bz2 compressed tarball.
> 
> Switch _SITE to https for better security and corporate firewall
> compatibility.
> 
> Add license files hash.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...gression-on-arm64-due-to-invalid-use-of-v.patch | 59 ++++++++++++++++++++++
>  package/libgpg-error/libgpg-error.hash             |  6 ++-
>  package/libgpg-error/libgpg-error.mk               |  5 +-
>  3 files changed, 67 insertions(+), 3 deletions(-)
>  create mode 100644 package/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
