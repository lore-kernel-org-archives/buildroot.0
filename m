From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Feb 2013 08:43:49 +0100
Subject: [Buildroot] [PATCH] toolchain-external: add new Microblaze
 toolchains
In-Reply-To: <20130205055011.GB4116@tarshish>
References: <1360021954-21225-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130205055011.GB4116@tarshish>
Message-ID: <20130205084349.3266b4c0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 5 Feb 2013 07:50:12 +0200, Baruch Siach wrote:
> Hi Thomas,
> 
> On Tue, Feb 05, 2013 at 12:52:34AM +0100, Thomas Petazzoni wrote:
> > +config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
> > +	bool "Xilinx Little Endian Microblaze GNU Tools"
> 
> [...]
> 
> > +config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
> > +	bool "Xilinx Little Endian Microblaze GNU Tools"
> 
> Are both little endian?

Good catch. No they are not both little endian, and it was way too late
when I send them, so my copy/pasting was wrong.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
