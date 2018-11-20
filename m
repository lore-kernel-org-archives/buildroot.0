From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 10:10:42 +0100
Subject: [Buildroot] [git commit branch/next]
 configs/olimex_a20_olinuxino_lime*: bump Linux/U-Boot versions
In-Reply-To: <20181120075153.41F8183C62@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 20 Nov 2018 08:54:35 +0100")
References: <20181120075153.41F8183C62@busybox.osuosl.org>
Message-ID: <87d0r0p10t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=bac251bee158ce390547a55eadd6df3aaebda37d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  configs/olimex_a20_olinuxino_lime2_defconfig | 8 ++++----
 >  configs/olimex_a20_olinuxino_lime_defconfig  | 8 ++++----
 >  2 files changed, 8 insertions(+), 8 deletions(-)

 > diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
 > index 716995aa7a..d846f4fedd 100644
 > --- a/configs/olimex_a20_olinuxino_lime2_defconfig
 > +++ b/configs/olimex_a20_olinuxino_lime2_defconfig
 > @@ -3,8 +3,8 @@ BR2_arm=y
 >  BR2_cortex_a7=y
 >  BR2_ARM_EABIHF=y
 
 > -# Linux headers same as kernel, a 4.18 series
 > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
 > +# Linux headers same as kernel, a 4.19 series
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y

Notice: We haven't merged 4.19 support yet, so this doesn't actually
work.

-- 
Bye, Peter Korsgaard
