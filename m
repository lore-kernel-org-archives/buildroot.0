From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 19:00:21 -0500 (EST)
Subject: [Buildroot] [PATCH] allow module-init-tools on uClinux
In-Reply-To: <20081203213438.GH8563@mx.loc>
References: <alpine.LFD.2.00.0812031545010.14328@xanadu.home>
	<20081203210728.GE8563@mx.loc>
	<alpine.LFD.2.00.0812031618170.14328@xanadu.home>
	<20081203213438.GH8563@mx.loc>
Message-ID: <alpine.LFD.2.00.0812031836491.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 3 Dec 2008, Bernhard Reutner-Fischer wrote:

> On Wed, Dec 03, 2008 at 04:21:11PM -0500, Nicolas Pitre wrote:
> >Eventually.  In the mean time this allows for the kernel to build and 
> >its modules to be installed.
> 
> Not sure if i understand you here. Why do you need a cross module-init-tools
> to build or install a kernel? Just curious..

FRom target/linux/Makefile.in line 203:
