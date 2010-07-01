From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jul 2010 08:45:12 +0200
Subject: [Buildroot] Kernel build process
In-Reply-To: <000f01cb18a2$d4f5fad0$7ee1f070$@pauljones.id.au>
References: <002401cb1843$dc1e2670$945a7350$@pauljones.id.au>
	<20100630185824.095c6ad0@surf>
	<000f01cb18a2$d4f5fad0$7ee1f070$@pauljones.id.au>
Message-ID: <20100701084512.5146e5a1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 1 Jul 2010 08:22:55 +1000
"Paul Jones" <paul@pauljones.id.au> wrote:

> Good point. I guess if we tell the user to run "make
> linux26-menuconfig" that would be just as good.

Or to give a configuration file or defconfig name. The problem with
"make linux26-menuconfig" is that the configuration of the kernel will
be stored in output/build/linux-..../.config, and being part of the
output/ directory, it will be removed if the user doesn't save it
elsewhere.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
