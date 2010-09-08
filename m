From: Joachim Pihl <joachim.pihl@sensordevelopments.com>
Date: Wed, 08 Sep 2010 08:39:43 +0200
Subject: [Buildroot] AVR32 kernel install bug
In-Reply-To: <020001cb4f1f$f01e01f0$d05a05d0$@pauljones.id.au>
References: <op.vinvdkgksev97k@joachim-lappis> <20100907150948.4de996e3@surf>
	<op.viny90lpsev97k@joachim-lappis> <20100907165650.7cf10d65@surf>
	<1283923886.18866.7.camel@joachim-laptop>
	<20100908082010.7a27de42@surf>
	<020001cb4f1f$f01e01f0$d05a05d0$@pauljones.id.au>
Message-ID: <op.vipbghh4sev97k@joachim-lappis>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 08 Sep 2010 08:34:48 +0200, Paul Jones <paul@pauljones.id.au>  
wrote:

> Also if you can use vmware using direct disk access (no virtual disk)  
> speeds
> things up considerably. Using a Q9400 I can build a toolchain + qt in  
> around
> 25 mins.

I think getting virtualbox to use more than one core for the VM will  
probably help even more, but disk access is probably another killer. I'll  
see what I can get virtualbox to do, but I am running a laptop, so adding  
another HD is not an option. Repartitioning is also a mess, but it could  
work.


-- 
Joachim Pihl
Development engineer
SENSOR DEVELOPMENTS AS
Tlf: +47 913 39 891
Nordre Kuller?d 21
NO-3241 Sandefjord
NORWAY
