From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 09:17:16 +0100
Subject: [Buildroot] [PATCH v8] board: add support for Intel Galileo Gen
 2
In-Reply-To: <1447834278.2751.8.camel@intel.com>
References: <1447778330.2974.66.camel@intel.com>
 <20151117232830.42e68602@free-electrons.com>
 <1447834278.2751.8.camel@intel.com>
Message-ID: <20151118091716.0edc0975@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ray,

On Wed, 18 Nov 2015 08:11:17 +0000, Kinsella, Ray wrote:

> > Why do you need host-mtools? I've kept it for now, but I'm not sure. Is
> > it used internally by genimage?
> 
> Yes its is used to make the EFI (vfat) partition, it uses mtools under
> the covers to copy grub into the right place. Strictly speaking it
> should be auto-selected when you select genimage. 

Is mtools *always* used by genimage, or only if you build a vfat
partition? I guess the later. And if that's the case, then it's a bit
annoying to have host-genimage unconditionally select host-mtools.

> > Also, it is generally customary to add a readme.txt in the board
> > folder, i.e in board/intel/galileo/ in your case to explain how to
> > build/use this configuration. What is especially useful is some
> > indication on which UART is used on the board, how to connect to it,
> > etc.
> 
> np, will do this. 
> I will include a couple of URLs to helpful serial cables. 

Great, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
