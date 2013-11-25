From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 25 Nov 2013 10:01:35 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-24
In-Reply-To: <CAAXf6LVEDgF+s-e90py61mucPmm96HNCShGpu12QdfYxumW80w@mail.gmail.com>
References: <20131125073002.2FB821014B4@stock.ovh.net>	<OF0E9DA113.910F94AB-ON86257C2E.00328BF4-86257C2E.003369F4@rockwellcollins.com>
 <CAAXf6LVEDgF+s-e90py61mucPmm96HNCShGpu12QdfYxumW80w@mail.gmail.com>
Message-ID: <OF0482DE56.273496AA-ON86257C2E.0057D59F-86257C2E.0058070B@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas D,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 11/25/2013 
09:55:17 AM:

> Hi Ryan,
> 
> On Mon, Nov 25, 2013 at 10:21 AM, Ryan Barnett
> <rjbarnet@rockwellcollins.com> wrote:
> > Thomas P, All,
> >
> > Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 
11/25/2013
> > 01:30:02 AM:
> >
> >>    powerpc |           host-protobuf-c-0.15 | NOK |
> >> 
http://autobuild.buildroot.net/results/10db94f960db6cc8b2fbcafa66aa487fc66f99c6/

> >
> > I looked into this last night and I was unable to reproduce the issue 
(from
> > pulling the defconfig). From looking at the logs, it appears that the 
issue
> > is that a file wasn't generated before trying to compile the code. In 
my
> > experience, errors like below are due to the makefile not having their
> > dependencies correct. I tired rebuilding this package around 5-7 times 
and I
> > never ran into this error with the defconfig provided.
> 
> How exactly did you start the build?
> Did you do something like 'make toolchain host-protobuf-c' or simply 
'make' ?
> While the former is a shortcut that can sometimes also show the
> problem, the latter has a higher chance of doing so. So when the first
> method doesn't work, you should try the second.

I first did 'make' and did not reproduce the failure. I then did 'make 
host-protobuf-c-dirclean host-protobuf-c' on the other builds.

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131125/49b72f00/attachment.html>
