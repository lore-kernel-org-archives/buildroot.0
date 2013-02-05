From: hayate <hayatelee@gmail.com>
Date: Tue, 5 Feb 2013 18:15:50 +0800
Subject: [Buildroot] Fwd: bug report: c++ programs built by toolchain crash
 by seg fault
In-Reply-To: <CAJXWAwzg3iPu6qW+E560nw=fQZ6=UMhNAkTGhbaoCnFbcfQdzQ@mail.gmail.com>
References: <CAJXWAwwHVddYF3StQByTW99aCDksiAwyOa_WdM7AbjGu3i6iJg@mail.gmail.com>
 <20130205084502.6b370422@skate>
 <CAJXWAwzg3iPu6qW+E560nw=fQZ6=UMhNAkTGhbaoCnFbcfQdzQ@mail.gmail.com>
Message-ID: <CAJXWAwwUdgS0DSGAvojfbZfZpxr9ZpGvM8+ojvAsSy0WSV85Zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forgot to mention maillist

---------- Forwarded message ----------
From: hayate <hayatelee@gmail.com>
Date: Tue, Feb 5, 2013 at 6:14 PM
Subject: Re: [Buildroot] bug report: c++ programs built by toolchain crash
by seg fault


I'll test it later.

It's a personal reason, because I have an old system that I cannot upgrade.
But since it's an explicit option there in buildroot still, I think it may
be a defect.

Regards,


On Tue, Feb 5, 2013 at 3:45 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear hayate,
>
> On Tue, 5 Feb 2013 14:24:55 +0800, hayate wrote:
>
> > arm little endian; generic arm; OABI; gcc 4.6.3 with c++ support;
> > uclibc 0.9.31.1
>
> Can you test with EABI?
>
> Really OABI is deprecated. It would not be surprising at all that there
> are issues with OABI.
>
> Do you have a compelling reason to stick with OABI if you are making a
> new toolchain?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130205/02b2d694/attachment-0001.html>
