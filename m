From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Jun 2018 15:56:25 +0200
Subject: [Buildroot] [PATCH 1/1] boost: bump to version 1.67.0
In-Reply-To: <20180624100337.27941-1-fontaine.fabrice@gmail.com>
References: <20180624100337.27941-1-fontaine.fabrice@gmail.com>
Message-ID: <20180624155625.5fa5eccb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jun 2018 12:03:37 +0200, Fabrice Fontaine wrote:
> Remove fifth patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/0005-fix-build-with-g-5.patch | 32 -----------------------------
>  package/boost/boost.hash                    |  4 ++--
>  package/boost/boost.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 35 deletions(-)
>  delete mode 100644 package/boost/0005-fix-build-with-g-5.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
