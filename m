From: =?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JHRgNC+0LTQutC40L0=?= <alexey.brodkin@gmail.com>
Date: Sat, 21 Oct 2017 20:12:49 +0300
Subject: [Buildroot] [PATCH] uboot: Make Kconfig a default build system
In-Reply-To: <20171021185641.300de9b6@windsurf>
References: <1508602460-4807-1-git-send-email-abrodkin@synopsys.com>
 <20171021183346.19bf1e91@windsurf>
 <CAML3pwWEC4u5_B9JFgUUTj1XJ2h0YOQe-EweyDYbSacpBPVNwA@mail.gmail.com>
 <20171021185641.300de9b6@windsurf>
Message-ID: <CAML3pwWY3=JBX4ZQVuUH=dvYMtuBPaXik64bRjPAm_0MMkdWeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2017-10-21 19:56 GMT+03:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Sat, 21 Oct 2017 19:44:35 +0300, ??????? ??????? wrote:
>
> > Ok that makes sense.
> > Only 62 of defconfigs mention BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG and
> > one mention BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY of totally 96.
> >
> > So chances are indeed some of 33 other boards might fail.
>
> Well the defconfigs that are in Buildroot we could easily fix, so it's
> not really the issue. The issue is more with all the defconfigs that
> people/companies have locally for their own projects.
>
> That being said, it's true at some point, it would make sense to switch
> over to Kconfig as the default. The question is when to do that without
> breaking things for too many users.


That's exactly the reason to upstream your stuff.
What's not in upstream it doesn't exist so why bother?

-Alexey
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171021/fc0a57d5/attachment.html>
