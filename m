From: Paul Jones <paul@pauljones.id.au>
Date: Tue, 13 Jul 2010 19:11:01 +1000
Subject: [Buildroot] Problems with custom config of kernel 2.6.34.1
In-Reply-To: <20100713085516.5a5c8d26@surf>
References: <4C3B80A7.1040305@gmx.net> <20100713085516.5a5c8d26@surf>
Message-ID: <000f01cb226b$51f11430$f5d33c90$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Tuesday, 13 July 2010 4:55 PM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] Problems with custom config of kernel 2.6.34.1
> 
> Hello Marcus,
> 
> On Mon, 12 Jul 2010 22:52:55 +0200
> Ossy <ossy1980@gmx.net> wrote:
> 
> > Hi mailinglist,
> >
> > I use the kernel version 2.6.33.6 without any problems. But since I
> > updated to the newer version 2.6.34.1 I'm not able to use a custom
> > config anymore.
> >
> > I loaded the old config into the kernel menuconfig and stored it as
> > new file linux-2.6.34.1.config. When I launched the overall make
> > process the kernel patches were applied fine, but the process runs
> > into text mode configuration:
> 
> Thanks for your report. Could you provide a step-by-step procedure to
> reproduce the problem from scratch ?

Isn't that just make oldconfig running? What happens if you press enter to
give the default answer to every question?


Paul.
