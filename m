From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Mon, 18 May 2015 11:21:16 +0300
Subject: [Buildroot] [PATCH 1/1] configs/riotboard: bump kernel to
	version 4.0
In-Reply-To: <87fv6u75g2.fsf@dell.be.48ers.dk>
References: <1431910358-8952-1-git-send-email-picmaster@mail.bg>
 <87fv6u75g2.fsf@dell.be.48ers.dk>
Message-ID: <5559A0FC.9060307@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 05/18/2015 09:41 AM, Peter Korsgaard wrote:
>>>>>> "Nikolay" == Nikolay Dimitrov <picmaster@mail.bg> writes:
>
>   > Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
>   > ---
>   >  configs/riotboard_defconfig |    6 +++---
>   >  1 file changed, 3 insertions(+), 3 deletions(-)
>
>   > diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
>   > index 6e581fa..91cdb1a 100644
>   > --- a/configs/riotboard_defconfig
>   > +++ b/configs/riotboard_defconfig
>   > @@ -20,13 +20,13 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
>
>   >  # kernel headers
>   >  BR2_KERNEL_HEADERS_VERSION=y
>   > -BR2_DEFAULT_KERNEL_VERSION="3.19.3"
>   > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
>   > +BR2_DEFAULT_KERNEL_VERSION="4.0"
>   > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
>
> Committed to next, thanks.

Thanks, have a nice week!

Regards,
Nikolay
