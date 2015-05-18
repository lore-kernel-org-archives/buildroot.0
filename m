From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 May 2015 08:41:49 +0200
Subject: [Buildroot] [PATCH 1/1] configs/riotboard: bump kernel to
	version 4.0
In-Reply-To: <1431910358-8952-1-git-send-email-picmaster@mail.bg> (Nikolay
 Dimitrov's message of "Mon, 18 May 2015 03:52:38 +0300")
References: <1431910358-8952-1-git-send-email-picmaster@mail.bg>
Message-ID: <87fv6u75g2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nikolay" == Nikolay Dimitrov <picmaster@mail.bg> writes:

 > Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
 > ---
 >  configs/riotboard_defconfig |    6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
 > index 6e581fa..91cdb1a 100644
 > --- a/configs/riotboard_defconfig
 > +++ b/configs/riotboard_defconfig
 > @@ -20,13 +20,13 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 >  # kernel headers
 >  BR2_KERNEL_HEADERS_VERSION=y
 > -BR2_DEFAULT_KERNEL_VERSION="3.19.3"
 > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 > +BR2_DEFAULT_KERNEL_VERSION="4.0"
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
