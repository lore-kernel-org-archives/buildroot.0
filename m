From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2012 10:36:34 +0100
Subject: [Buildroot] Image created is not booting,
 waiting for infinite time
In-Reply-To: <BLU0-SMTP296551C52410B48DE52F60D28C0@phx.gbl>
References: <BLU0-SMTP88C894F00679EB12CEC0A3D28F0@phx.gbl>
 <20120128124931.5dddc20e@skate>
 <BLU0-SMTP296551C52410B48DE52F60D28C0@phx.gbl>
Message-ID: <20120129103634.620aced8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 29 Jan 2012 12:00:41 +0530,
inblueswithu <inblueswithu@hotmail.com> a ?crit :

> But the default here is linux-3.1.config. Is that ok??

Yes. The kernel headers version can be older than the kernel version
running on the platform, since the kernel-to-userspace ABI is backward
compatible.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
