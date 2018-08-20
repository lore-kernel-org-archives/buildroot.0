From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:08:22 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/vtun: bump version to 3.0.4
In-Reply-To: <20180820061400.28737-1-bernd.kuhls@t-online.de>
References: <20180820061400.28737-1-bernd.kuhls@t-online.de>
Message-ID: <20180820230822.2de9516c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 08:14:00 +0200, Bernd Kuhls wrote:
> Removed patch 0003, upstream fixes configure.in.
> Added patch from Fedora to fix OpenSSL 1.1.x. build.
> Added upstream hashes and license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vtun/0003-fixup-configure.in.patch |  92 -------
>  package/vtun/0003-openssl11.patch          | 294 +++++++++++++++++++++
>  package/vtun/vtun.hash                     |   6 +-
>  package/vtun/vtun.mk                       |   2 +-
>  4 files changed, 300 insertions(+), 94 deletions(-)
>  delete mode 100644 package/vtun/0003-fixup-configure.in.patch
>  create mode 100644 package/vtun/0003-openssl11.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
