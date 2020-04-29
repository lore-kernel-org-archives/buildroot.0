From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 23:01:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/libusb-compat: bump to version
 0.1.7
In-Reply-To: <20200428074743.23840-1-james.hilliard1@gmail.com>
References: <20200428074743.23840-1-james.hilliard1@gmail.com>
Message-ID: <20200429230107.0a230288@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Apr 2020 01:47:43 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch that is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...d-fixed-width-integer-types-in-usb.h.patch | 237 ------------------
>  ... => 0001-fix-a-build-issue-on-linux.patch} |   0
>  package/libusb-compat/libusb-compat.hash      |   2 +-
>  package/libusb-compat/libusb-compat.mk        |   4 +-
>  4 files changed, 3 insertions(+), 240 deletions(-)
>  delete mode 100644 package/libusb-compat/0001-Use-C99-standard-fixed-width-integer-types-in-usb.h.patch
>  rename package/libusb-compat/{0002-fix-a-build-issue-on-linux.patch => 0001-fix-a-build-issue-on-linux.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
