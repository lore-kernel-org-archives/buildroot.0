From: hayate <hayatelee@gmail.com>
Date: Tue, 5 Feb 2013 21:39:31 +0800
Subject: [Buildroot] bug report: c++ programs built by toolchain crash
 by seg fault
In-Reply-To: <20130205084502.6b370422@skate>
References: <CAJXWAwwHVddYF3StQByTW99aCDksiAwyOa_WdM7AbjGu3i6iJg@mail.gmail.com>
 <20130205084502.6b370422@skate>
Message-ID: <CAJXWAwww9sbeRvU=rvFzp8O_tx6ePMHqd1NrYTcCqFfAs-Y-XA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc 4.6.3 with EABI is fine (as expected)


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130205/ff7437d3/attachment.html>
