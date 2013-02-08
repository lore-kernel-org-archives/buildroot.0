From: hayate <hayatelee@gmail.com>
Date: Fri, 8 Feb 2013 12:57:18 +0800
Subject: [Buildroot] Fwd: bug report: c++ programs built by toolchain
 crash by seg fault
In-Reply-To: <5112EBB2.7060409@mind.be>
References: <CAJXWAwwHVddYF3StQByTW99aCDksiAwyOa_WdM7AbjGu3i6iJg@mail.gmail.com>
 <20130205084502.6b370422@skate>
 <CAJXWAwzg3iPu6qW+E560nw=fQZ6=UMhNAkTGhbaoCnFbcfQdzQ@mail.gmail.com>
 <CAJXWAwwUdgS0DSGAvojfbZfZpxr9ZpGvM8+ojvAsSy0WSV85Zw@mail.gmail.com>
 <5112EBB2.7060409@mind.be>
Message-ID: <CAJXWAwzQVyKW-uEBWawRFhcQ1WzrDrnhhOLB8WSEL=-SBQT8Yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 7, 2013 at 7:48 AM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 05/02/13 11:15, hayate wrote:
>
>> It's a personal reason, because I have an old system that I cannot
>> upgrade.
>>
>
>  If you're using buildroot, you're basically upgrading your system, right?
>  Or are you just using buildroot to create a compiler?

I meant my embedded device is running an old linux system that I cannot
upgrade because some kernel modules were provided by vendors and private.

Hence I actually want to use buildroot to create a cross compiler for that,
not whole root filesystem

>
>
>  But since it's an explicit option there in buildroot still, I
>> think it may be a defect.
>>
>
>  True. We should deprecate OABI.


4.7.x is disabled explicitly, 4.6.x is not. So if buildroot cannot build a
working compiler for OABI, it is fine to disable 4.6.x too. Just need
somebody to confirm it.

>

 Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130208/a25f2b58/attachment.html>
