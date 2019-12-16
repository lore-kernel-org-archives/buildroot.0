From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 21:17:44 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/coreutils: bump version to
 8.31
In-Reply-To: <20190825172412.9524-1-bernd.kuhls@t-online.de>
References: <20190825172412.9524-1-bernd.kuhls@t-online.de>
Message-ID: <20191216211744.45b468ad@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Aug 2019 19:24:12 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added license hash.
> Added patch to fix build error with uclibc.
> 
> Release notes:
> https://lists.gnu.org/archive/html/coreutils/2019-03/msg00042.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0002-strtod_fix_clash_with_strtold.patch  | 64 +++++++++++++++++++
>  package/coreutils/coreutils.hash              |  4 +-
>  package/coreutils/coreutils.mk                |  2 +-
>  3 files changed, 68 insertions(+), 2 deletions(-)
>  create mode 100644 package/coreutils/0002-strtod_fix_clash_with_strtold.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
