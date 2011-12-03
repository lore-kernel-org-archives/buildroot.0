From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2011 09:28:54 +0100
Subject: [Buildroot] USB FAT drive in Linux on MPC8321
In-Reply-To: <CALo-6+i-OXWXHxpmsH4tab9RBhT5qoWOcpSbfR84nbt9GaAn4Q@mail.gmail.com>
References: <CALo-6+i-OXWXHxpmsH4tab9RBhT5qoWOcpSbfR84nbt9GaAn4Q@mail.gmail.com>
Message-ID: <20111203092854.3301cf7f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

Le Fri, 2 Dec 2011 14:37:17 -0800,
Charles Krinke <charles.krinke@gmail.com> a ?crit :

> To illustrate, here is an ls from my debian laptop followed by an ls
> of the same USB drive from the MPC8321 target illustrating the issues.

Presumably your kernel has CONFIG_FAT_FS enabled, but not
CONFIG_VFAT_FS enabled. The latter is the one that enables long file
name support.

Can you provide your kernel .config and give details on your kernel
version (vanilla version, version modified by an hardware vendor,
etc.) ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
