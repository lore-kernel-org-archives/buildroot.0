From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Dec 2017 23:48:19 +0100
Subject: [Buildroot] [PATCH 1/1] configs/orangepi-lite: bump Linux to
 4.14.4
In-Reply-To: <20171208182904.29434-1-jan.kraval@gmail.com> (Jan Kraval's
 message of "Fri, 8 Dec 2017 19:29:04 +0100")
References: <20171208182904.29434-1-jan.kraval@gmail.com>
Message-ID: <87bmj8zvik.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jan" == Jan Kraval <jan.kraval@gmail.com> writes:

 > Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
 > ---
 >  configs/orangepi_lite_defconfig | 3 +--
 >  1 file changed, 1 insertion(+), 2 deletions(-)

 > diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
 > index b1f6598ccc..28fb57ab98 100644
 > --- a/configs/orangepi_lite_defconfig
 > +++ b/configs/orangepi_lite_defconfig
 > @@ -1,14 +1,13 @@
 >  BR2_arm=y
 >  BR2_cortex_a7=y
 >  BR2_ARM_FPU_VFPV4=y
 > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y

I've added an explicit

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y

To ensure this doesn't break when we add 4.15 and committed, thanks.

-- 
Bye, Peter Korsgaard
