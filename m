From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:20:16 +0200
Subject: [Buildroot] [PATCH 1/1] blktrace: bump to version 1.2.0
In-Reply-To: <20180909202137.19888-1-fontaine.fabrice@gmail.com>
References: <20180909202137.19888-1-fontaine.fabrice@gmail.com>
Message-ID: <20180910172016.7c07e453@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 22:21:37 +0200, Fabrice Fontaine wrote:
> - Remove patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-iowatcher-link-with-lrt.patch        | 31 -------------------
>  package/blktrace/blktrace.hash                |  6 +++-
>  package/blktrace/blktrace.mk                  |  2 +-
>  3 files changed, 6 insertions(+), 33 deletions(-)
>  delete mode 100644 package/blktrace/0001-iowatcher-link-with-lrt.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
