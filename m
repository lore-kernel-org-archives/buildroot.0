From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 15:55:36 +0100
Subject: [Buildroot] [PATCH 1/1] spi-tools: new package
In-Reply-To: <1448072069-5007-1-git-send-email-nunes.erico@gmail.com>
References: <1448072069-5007-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20151129155536.5bad0012@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Erico Nunes,

On Sat, 21 Nov 2015 00:14:29 -0200, Erico Nunes wrote:
> This package contains some simple command line tools to help using Linux
> spidev devices.
> 
> https://github.com/cpb-/spi-tools
> 
> The included version is based in a sha1 and not a tagged version as the
> current master branch contains autotools support for build but there is
> no tagged version with autotools support yet.
> 
> The only other quirk with the recipe is related to the VERSION define
> which is normally obtained in build time via git for this package, but
> that would fail within Buildroot as the package build is normally not
> performed inside a git repository.
> To work around that, I have added a hook which will substitute change
> the VERSION to match that of the Buildroot package.
> 
> I have tested this package in an ARM target with a custom SPI device.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  package/Config.in                |  1 +
>  package/spi-tools/Config.in      |  7 +++++++
>  package/spi-tools/spi-tools.hash |  2 ++
>  package/spi-tools/spi-tools.mk   | 24 ++++++++++++++++++++++++
>  4 files changed, 34 insertions(+)
>  create mode 100644 package/spi-tools/Config.in
>  create mode 100644 package/spi-tools/spi-tools.hash
>  create mode 100644 package/spi-tools/spi-tools.mk

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
