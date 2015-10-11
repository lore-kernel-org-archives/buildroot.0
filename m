From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 14:53:12 +0200
Subject: [Buildroot] [PATCH 1/1] libusb-compat: backport C99 std use
 patch
In-Reply-To: <1444553310-26549-1-git-send-email-gwenj@trabucayre.com>
References: <1444553310-26549-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20151011145312.47afd8f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Sun, 11 Oct 2015 10:48:30 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> fix : http://autobuild.buildroot.net/results/e63/e6360386a0a99900b83494924494ec40552d8dbe/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  ...andard-fixed-width-integer-types-in-usb.h.patch | 233 +++++++++++++++++++++
>  1 file changed, 233 insertions(+)
>  create mode 100644 package/libusb-compat/0001-Use-C99-standard-fixed-width-integer-types-in-usb.h.patch

Applied. I've indicated in the patch itself a reference to the upstream
commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
