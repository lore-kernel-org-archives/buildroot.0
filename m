From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 May 2012 22:21:49 +0200
Subject: [Buildroot] cp210x needed
In-Reply-To: <CAFC29aV9nhzG8_ZAG8j1QCGqY_Qv1tg39sGac-5sTUvQL=uRJw@mail.gmail.com>
References: <CAFC29aV9nhzG8_ZAG8j1QCGqY_Qv1tg39sGac-5sTUvQL=uRJw@mail.gmail.com>
Message-ID: <20120517222149.3c657ce1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 17 May 2012 13:18:01 -0700,
Ron Eggler <reggler@semiosbio.com> a ?crit :

> I need the cp210x driver for USB/serial conversion. Does anyone know how I
> can get this into my kernel using buildroot?

make linux-menuconfig

will let you enter the kernel configuration tool, in which you can
enable the cp210x driver.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
