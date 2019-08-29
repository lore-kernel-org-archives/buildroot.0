From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:15:49 +0200
Subject: [Buildroot] [PATCH] package/libusb: bump to 1.0.23
In-Reply-To: <20190829104103.11969-1-zgyarmati@zgyarmati.de>
References: <20190829104103.11969-1-zgyarmati@zgyarmati.de>
Message-ID: <20190829221549.617df62f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Aug 2019 12:41:03 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Also remove obsolete patch and not calling autoreconf (as configure.ac
> is not patched anymore)
> 
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  ...x-detection-of-clock_gettime-library.patch | 36 -------------------
>  package/libusb/libusb.hash                    |  2 +-
>  package/libusb/libusb.mk                      |  4 +--
>  3 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 package/libusb/0001-configure.ac-fix-detection-of-clock_gettime-library.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
