From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 22:04:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/p7zip: add support for blackfin
In-Reply-To: <1465408487-22960-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465408487-22960-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160608220439.6655ec0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Jun 2016 19:54:47 +0200, Bernd Kuhls wrote:
> Tested using this defconfig:
> 
> BR2_bfin=y
> BR2_PACKAGE_P7ZIP=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/p7zip/0001-bfin.patch | 19 +++++++++++++++++++
>  package/p7zip/Config.in       |  3 ---
>  2 files changed, 19 insertions(+), 3 deletions(-)
>  create mode 100644 package/p7zip/0001-bfin.patch

I also saw that it was pretty simple, but on the other hand, I thought
that nobody would care about p7zip. But oh well, now that you have done
the patch, I applied it. Thanks!

(Unrelated: could you help reviewing the pending mesa3d and other
related patches pending in patchwork? Thanks!)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
