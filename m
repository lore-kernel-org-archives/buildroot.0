From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 22:26:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/connman: bump version to 1.36
In-Reply-To: <20180613170833.7808-1-bernd.kuhls@t-online.de>
References: <20180613170833.7808-1-bernd.kuhls@t-online.de>
Message-ID: <20180613222600.2ad1362a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jun 2018 19:08:33 +0200, Bernd Kuhls wrote:
> Added licence hash, removed patch applied upstream
> https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=bdfb3526466f8fb8f13d9259037d8f42c782ce24
> 
> Renumbered remaining patch.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ure.patch => 0001-nat-build-failure.patch} |  0
>  ...01-tethering-Reorder-header-includes.patch | 37 -------------------
>  package/connman/connman.hash                  |  4 +-
>  package/connman/connman.mk                    |  2 +-
>  4 files changed, 4 insertions(+), 39 deletions(-)
>  rename package/connman/{0002-nat-build-failure.patch => 0001-nat-build-failure.patch} (100%)
>  delete mode 100644 package/connman/0001-tethering-Reorder-header-includes.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
