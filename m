From: Paul Jones <paul@pauljones.id.au>
Date: Thu, 1 Jul 2010 17:01:41 +1000
Subject: [Buildroot] Kernel build process
In-Reply-To: <20100701084512.5146e5a1@surf>
References: <002401cb1843$dc1e2670$945a7350$@pauljones.id.au><20100630185824.095c6ad0@surf><000f01cb18a2$d4f5fad0$7ee1f070$@pauljones.id.au>
	<20100701084512.5146e5a1@surf>
Message-ID: <000c01cb18eb$437392e0$ca5ab8a0$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Thursday, 1 July 2010 4:45 PM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] Kernel build process
> 
> On Thu, 1 Jul 2010 08:22:55 +1000
> "Paul Jones" <paul@pauljones.id.au> wrote:
> 
> > Good point. I guess if we tell the user to run "make
> > linux26-menuconfig" that would be just as good.
> 
> Or to give a configuration file or defconfig name. The problem with "make
> linux26-menuconfig" is that the configuration of the kernel will be stored
in
> output/build/linux-..../.config, and being part of the output/ directory,
it will
> be removed if the user doesn't save it elsewhere.

Why not have buildroot copy it back? I find it a pain having to remember to
copy my .config before I rm -Rf the output dir.
Also would a new user know how to create a .config? 



Paul.
