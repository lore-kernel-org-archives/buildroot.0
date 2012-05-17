From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 May 2012 22:45:05 +0200
Subject: [Buildroot] cp210x needed
In-Reply-To: <CAFC29aX+g8jJXvp=hMXuXX7WKLNXGuAQ9KeQFZ4Hdf822MNpfQ@mail.gmail.com>
References: <CAFC29aV9nhzG8_ZAG8j1QCGqY_Qv1tg39sGac-5sTUvQL=uRJw@mail.gmail.com>
 <20120517222149.3c657ce1@skate>
 <CAFC29aX+g8jJXvp=hMXuXX7WKLNXGuAQ9KeQFZ4Hdf822MNpfQ@mail.gmail.com>
Message-ID: <20120517224505.31267c33@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 17 May 2012 13:35:46 -0700,
Ron Eggler <reggler@semiosbio.com> a ?crit :

> Right but I haven't been able to find it so I wasn't sure if "make
> menuconfig"
> is the right way to do it...?

In Buildroot, if you run "make menuconfig", you get the Buildroot
options.

If you have the kernel options, you have to run "make linux-menuconfig".

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
