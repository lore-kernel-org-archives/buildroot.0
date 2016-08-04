From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 22:51:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvpx: Fix compilation when
 __uClinux__ is defined
In-Reply-To: <1469954504-31016-1-git-send-email-bernd.kuhls@t-online.de>
References: <1469954504-31016-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160804225141.360b6f4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 10:41:44 +0200, Bernd Kuhls wrote:
> The buildroot toolchains do not contain lddk.h
> 
> Fixes
> http://autobuild.buildroot.net/results/ae7/ae7ba1d5979ebe39aace628fa8ff2c8f08a70a98/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...mem-vpx_mem.h-Fix-compilation-with-uClibc.patch | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch

Applied to master after tweaking the commit log and the patch
description. Please send the patch upstream after taking Khem's comment
into account.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
