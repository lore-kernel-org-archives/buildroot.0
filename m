From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Apr 2013 17:32:01 +0200
Subject: [Buildroot] Trying to configure the kernel
In-Reply-To: <5163AB3E.2040004@mind.be>
References: <1365192366.30488.205.camel@station1.ormlab.com>
 <20130406152619.7d3f29c1@skate> <5163AB3E.2040004@mind.be>
Message-ID: <20130413173201.502d0dcb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 09 Apr 2013 07:46:38 +0200, Arnout Vandecappelle wrote:
> On 06/04/13 15:26, Thomas Petazzoni wrote:
> > In short, there is no way to just "start the kernel configuration",
> > you must first give it an initial existing configuration. Maybe we
> > should add an option "Just run the kernel configuration with
> > whatever defaults for the current architecture", so that you don't
> > have to give an existing defconfig or an existing kernel
> > configuration file.
> 
>   I posted a patch to do exactly that a long time ago. Don't have 
> internet access at the moment so can't look up the patchwork
> reference.

I think this is something we should commit, probably as part of a
rework of how linux-menuconfig/barebox-menuconfig and al. work, as per
our discussions at the FOSDEM Buildroot Developers meeting.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
