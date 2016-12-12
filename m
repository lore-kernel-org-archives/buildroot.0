From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Dec 2016 12:13:59 +0100
Subject: [Buildroot] [PATCH] olimex_a20_olinuxino_lime: bump kernel to
	4.9
In-Reply-To: <1481540569-20867-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Mon, 12 Dec 2016 12:02:49 +0100")
References: <1481540569-20867-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87d1gxqu14.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  configs/olimex_a20_olinuxino_lime_defconfig | 6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
 > index 8d63606..b7cb0dd 100644
 > --- a/configs/olimex_a20_olinuxino_lime_defconfig
 > +++ b/configs/olimex_a20_olinuxino_lime_defconfig
 > @@ -5,8 +5,8 @@ BR2_ARM_EABIHF=y
 
 >  BR2_TOOLCHAIN_EXTERNAL=y
 
 > -# Linux headers same as kernel, a 4.4 series
 > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 > +# Linux headers same as kernel, a 4.9 series
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y

Ehh, what is this against? We don't have BR2_TOOLCHAIN_EXTERNAL=y
enabled in the lime (or any other) defconfigs.

-- 
Bye, Peter Korsgaard
