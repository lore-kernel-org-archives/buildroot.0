From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:32:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/i2pd: bump to version 2.32.1
In-Reply-To: <20200607100354.3983731-1-fontaine.fabrice@gmail.com>
References: <20200607100354.3983731-1-fontaine.fabrice@gmail.com>
Message-ID: <20200610233243.200a1862@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Jun 2020 12:03:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch, not needed since version 2.32.0 and
> https://github.com/PurpleI2P/i2pd/commit/db6a0e6ad9124ef9b6217af487b3c844234ba5e1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ....txt-don-t-install-source-and-licens.patch | 58 -------------------
>  package/i2pd/i2pd.hash                        |  2 +-
>  package/i2pd/i2pd.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 60 deletions(-)
>  delete mode 100644 package/i2pd/0001-build-CMakeLists.txt-don-t-install-source-and-licens.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
