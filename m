From: Gerhard Heift <gerhard@heift.name>
Date: Fri, 15 Jan 2016 19:18:22 +0100
Subject: [Buildroot] [PATCH] uboot-tools: fix for linux 4.4
In-Reply-To: <87pox2yb5g.fsf@dell.be.48ers.dk>
References: <1452856397-21566-1-git-send-email-Gerhard@Heift.Name>
 <87pox2yb5g.fsf@dell.be.48ers.dk>
Message-ID: <CACeaM89dURUrB7frSMgMLg+tvbqM4YVwpaZiwLNHnm5=Kh=7nQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-01-15 19:01 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Gerhard" == Gerhard Heift <gerhard@heift.name> writes:
>
>  > Since linux 4.4 <mtd/mtd-user.h> does not include <stdint.h> any more, so it
>  > had to be included explicitly.
>
>  > See commit 137d36af4a53858b8db7ca83c8480247118b8bdf of the linux kernel.
>
>  > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=137d36af4a53858b8db7ca83c8480247118b8bdf
>
> Has this been fixed upstream? U-Boot 2016.01 is out, so if it is fixed
> upstream then I would prefer to change the version instead.

No, this is not yet fixed in 2016-01.

> If it isn't upstream, please send the fix to the u-boot list first.

I sent this fix to the u-boot list too, but it since the list is
moderated the mail is not yet approved by a moderater and therefor not
yet public.

> Thanks!

Regards,
  Gerhard
