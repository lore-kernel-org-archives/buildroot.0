From: William Kennington <wak@google.com>
Date: Thu, 17 Nov 2016 19:10:23 +0000
Subject: [Buildroot] [PATCH 1/1] python-protobuf: Allow host building
In-Reply-To: <20161117101409.4713ef90@free-electrons.com>
References: <20161117061212.4638-1-wak@google.com>
 <20161117093239.05721e0e@free-electrons.com>
 <CAPnigKkVJPa4BSJc1JNLUJB9rsREJPv2pkkG_mvTwByUGWDhjg@mail.gmail.com>
 <20161117101409.4713ef90@free-electrons.com>
Message-ID: <CAPnigKkHkfhbtsiAizHCY=hmLH1qOAqZ66r+vKMERC3OYhuUBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sounds good, closed. I'll submit the new patch series when it is ready.

On Thu, Nov 17, 2016 at 1:14 AM Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Thu, 17 Nov 2016 08:51:20 +0000, William Kennington wrote:
>
> > The intention is to add nanopb as a host package for use in a library
> that
> > will also eventually be added. I can just add that to this patch series
> if
> > needed. I've never sent PR's via mail so I figured i would start with a
> > tiny one to try things out which is why I didn't also send nanopb.
>
> OK, understood.
>
> > Unfortunately the library depending on nanopb can't be added at this time
> > but I plan to have it upstream within a month.
>
> It would be great to send the whole thing as a patch series:
>
>  PATCH 1: adds the host variant of python-protobuf
>  PATCH 2: adds the host nanopb package
>  PATCH 3: adds the library that itself needs the host nanopb package
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161117/8b23a748/attachment.html>
