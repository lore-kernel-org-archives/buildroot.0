From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2011 14:39:04 +0200
Subject: [Buildroot] Incorrect sysroot?
In-Reply-To: <BLU0-SMTP205DA131C115414D017385BA4FE0@phx.gbl>
References: <BLU0-SMTP205DA131C115414D017385BA4FE0@phx.gbl>
Message-ID: <20111007143904.3efef718@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 7 Oct 2011 22:22:56 +1000,
Ether Brat <etherbrat@hotmail.com> a ?crit :

> I am trying to use buildroot with an external toolchain.
> 
> The following output from buildroot seems to indicate that sysroot has
> not been set up correctly:
> 
> =====<quote>
> checking for avr32-linux-gcc...
> /home/neil/Projects/Atmel-buildroot-avr32-v3.0.0-1-1/output/staging/usr/bin/avr32-linux-gcc

This looks like a path of a relatively recent Buildroot.

> -I/home/neil/Projects/ICnova-20110104-2/ICnova/build_avr32/staging_dir/include

And this a path from a very old Buildroot.

Aren't you mixing two Buildroot versions here ? Can you detail where
your external toolchain is coming from, where we can get it ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
