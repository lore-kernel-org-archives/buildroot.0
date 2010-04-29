From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Apr 2010 12:03:54 +0200
Subject: [Buildroot] Still can't build working rootfswith
 crosstool-NGtoolchain
In-Reply-To: <hqn98s$5sn$1@dough.gmane.org>
References: <hqhq8e$uau$1@dough.gmane.org>
	<8D63FCBEC4B04D56B92C74260683A038@development>
	<028801cae0e3$3ebe5720$bc3b0560$@com>
	<5D7DDABC417D46CFACF64003BB0EBC2F@development>
	<hqn0op$14i$1@dough.gmane.org>
	<82069254E03F44CB90EDB741DB18CBF9@development>
	<hqn98s$5sn$1@dough.gmane.org>
Message-ID: <20100429120354.2f09a799@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 21 Apr 2010 16:31:24 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> If it's taking that long, I suspect you're also building a toolchain
> and kernel everytime.  When I realized that partial rebuilds weren't
> practical, I switched to using an external toolchain.  With an
> external toolchain and an external download directory, doing a
> from-scratch basic rootfs build takes about 6-7 minutes on a single
> CPU, 2GHz AMD Athlon64.
> 
> I also switched to building my kernel outside of buildroot.  If you're
> doing any sort of kernel development (or just want to try
> experimenting with kernel configurations), doing the kernel builds
> with buildroot is pretty clumsy.
> 
> Once you've got a kernel configuration figured out and set in stone,
> it could be useful to have the kernel built by buildroot, but it
> doesn't seem to be a paractical way to do kernel development.

This is also exactly what I do. We should probably document a bit more
some typical "use cases" in the Buildroot documentation.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
