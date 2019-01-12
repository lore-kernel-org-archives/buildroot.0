From: David J. Fogle <Dave@exitstrategytech.com>
Date: Sat, 12 Jan 2019 17:39:17 +0000
Subject: [Buildroot] [PATCH] package/rauc: version bump to 1.0
In-Reply-To: <20190112183941.233b8b85@windsurf.home>
References: <2dcda5ba55a548c5a61cb30db7686ba9@exitstrategytech.com>,
 <20190112183941.233b8b85@windsurf.home>
Message-ID: <2045c659b0da41f8a508dae6666185e1@exitstrategytech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Awesome! Thank you kindly, I will let the RAUC guys know the patch is in. Have a great weekend!



David Fogle

CTO - Exit Strategy


-------- Original message --------
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: 1/12/19 11:37 AM (GMT-06:00)
To: "David J. Fogle" <Dave@exitstrategytech.com>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH] package/rauc: version bump to 1.0

Hello,

On Mon, 7 Jan 2019 22:44:07 +0000, David J. Fogle wrote:
> For details see [1]
>
> This bump also deleted the two patch files for the RAUC package. These
> were related to eMMC support being made optional, and workaround for
> olde kernel. Both of these patch sets have been merged into upsteam in
> the rauc git repos.
>
> Older kernel workaound:
> https://github.com/rauc/rauc/commit/993b698c48789baea51f8b7c47b1e057ba328033#diff-b3a0044e6a3b6a8b16933e72f416c8f1
>
> Make eMMC selectable:
> https://github.com/rauc/rauc/commit/f85d1cab07376c7680ef4d9e45a6baf345e24e37#diff-365367c8cde56aafd5cbad767e1c9738
>
> [1] https://github.com/rauc/rauc/releases/tag/v1.0
>
> Signed-off-by: David J Fogle dave at exitstrategytech.com
> ---
>  ...mmc-add-workaround-for-older-kernels.patch |  33 -----
>  ...eMMC-boot-partition-support-optional.patch | 116 ------------------
>  package/rauc/rauc.hash                        |   2 +-
>  package/rauc/rauc.mk                          |   3 +-
>  4 files changed, 2 insertions(+), 152 deletions(-)
>  delete mode 100644 package/rauc/0001-emmc-add-workaround-for-older-kernels.patch
>  delete mode 100644 package/rauc/0002-build-make-eMMC-boot-partition-support-optional.patch

Applied to master after dropping AUTORECONF = YES, as noticed by
Baruch. Thanks!

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190112/94039afd/attachment.html>
