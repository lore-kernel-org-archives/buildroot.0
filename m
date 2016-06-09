From: Matt Fornero <Matt.Fornero@mathworks.com>
Date: Thu, 9 Jun 2016 15:18:32 +0000
Subject: [Buildroot] [PATCH] libiio: Fix pthread linking for iiod
In-Reply-To: <20160609103624.2e4db9fb@free-electrons.com>
References: <20160608235050.74fe60e9@free-electrons.com>
 <1465434176-548-1-git-send-email-mfornero@mathworks.com>
 <20160609103624.2e4db9fb@free-electrons.com>
Message-ID: <74f79e0057b844cfb73be5127b56accf@ex13amer-00-ah.ad.mathworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Merged into upstream:
https://github.com/analogdevicesinc/libiio/pull/30

[Sorry for the double mail Thomas-- first message was bounced from the
list due to using the wrong email address]

-Matt

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Thursday, June 09, 2016 1:36 AM
> To: Matt Fornero <Matt.Fornero@mathworks.com>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] libiio: Fix pthread linking for iiod
> 
> Hello,
> 
> On Wed,  8 Jun 2016 21:02:56 -0400, Matthew Fornero wrote:
> > Update the iiod CMake configuration to resolve pthread linking issues
> > introduced with commit:
> >
> > 17ee15da70d23c314a3264c87a785101cbd9d85d
> > ("libiio: Bump version to 0.6")
> >
> > Fixes:
> >
> http://autobuild.buildroot.net/results/ffe/ffec14aa79833a6f0889a87b31
> d
> > ae464d083e6a8/
> >
> http://autobuild.buildroot.net/results/49f/49f249632ed021ebe73ee7fab
> 1b
> > 55fb3bb4c08f8/
> >
> > Signed-off-by: Matthew Fornero <mfornero@mathworks.com>
> > ---
> >  ...IIOD-Link-pthread-with-no-network-backend.patch |   30
> ++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >  create mode 100644
> > package/libiio/0002-IIOD-Link-pthread-with-no-network-
> backend.patch
> 
> Applied to master, thanks. Please submit upstream if not already done!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering http://free-
> electrons.com
