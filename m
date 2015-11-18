From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Wed, 18 Nov 2015 08:11:17 +0000
Subject: [Buildroot] [PATCH v8] board: add support for Intel Galileo Gen
 2
In-Reply-To: <20151117232830.42e68602@free-electrons.com>
References: <1447778330.2974.66.camel@intel.com>
 <20151117232830.42e68602@free-electrons.com>
Message-ID: <1447834278.2751.8.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> I've applied your patch to next, after making some small additional
> changes. See below.
> 

Yes, apologies for the trailing spaces and missing tabs ... (again)

> Why do you need host-mtools? I've kept it for now, but I'm not sure. Is
> it used internally by genimage?

Yes its is used to make the EFI (vfat) partition, it uses mtools under
the covers to copy grub into the right place. Strictly speaking it
should be auto-selected when you select genimage. 

> Also, it is generally customary to add a readme.txt in the board
> folder, i.e in board/intel/galileo/ in your case to explain how to
> build/use this configuration. What is especially useful is some
> indication on which UART is used on the board, how to connect to it,
> etc.

np, will do this. 
I will include a couple of URLs to helpful serial cables. 

> 
> Since I've applied your patch to the next branch, please base your
> future submissions on this branch.

Will do

> Thanks a lot!

Thank you - Ray K
