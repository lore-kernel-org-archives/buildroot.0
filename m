From: =?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JHRgNC+0LTQutC40L0=?= <alexey.brodkin@gmail.com>
Date: Sat, 21 Oct 2017 19:44:35 +0300
Subject: [Buildroot] [PATCH] uboot: Make Kconfig a default build system
In-Reply-To: <20171021183346.19bf1e91@windsurf>
References: <1508602460-4807-1-git-send-email-abrodkin@synopsys.com>
 <20171021183346.19bf1e91@windsurf>
Message-ID: <CAML3pwWEC4u5_B9JFgUUTj1XJ2h0YOQe-EweyDYbSacpBPVNwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2017-10-21 19:33 GMT+03:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Sat, 21 Oct 2017 19:14:20 +0300, Alexey Brodkin wrote:
> > Given now default U-Boot version is 2017.09 and it requires
> > Kconfig build system it makes perfect sense to have default
> > build system which matches U-Boot version requirements.
> >
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>
> This will break all defconfigs of people that still use older U-Boot
> versions. So I'm not sure if/when we want to do it.


Ok that makes sense.
Only 62 of defconfigs mention BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG and
one mention BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY of totally 96.

So chances are indeed some of 33 other boards might fail.

-Alexey
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171021/65652ece/attachment.html>
