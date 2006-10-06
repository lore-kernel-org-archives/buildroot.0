From: =?ISO-8859-1?Q?Hern=E1n_Freschi?= <hjf@hjf.com.ar>
Date: Thu, 05 Oct 2006 21:57:24 -0300
Subject: [Buildroot] Compling buildroot - problems with libgcc_s.so.1
Message-ID: <4525A9F4.4010903@hjf.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks, I'm trying to build the latest buildroot but I ran into some 
problems. To make things easier, I'm just using the stable uClibc and 
Busybox (couldn't make it to compile with the latest snapshots).

I succesfully generated an ext2 root, and tried to run it on qemu. It 
boots, the kernel loads fine, but then it starts complaining about 
missing libgcc_s.so.1.

I mounted that fs and copied libgcc_s.so.1 and it works when I chroot 
into it (without copying that file bash fails) but not when I boot it. I 
read somewhere that this is related to the development system's gcc 
and/or libraries. But I didn't find what I have to do to make it work. 
Can somebody help me?

All I changed in the default configuration was to make it work with 
stable uclibc/busybox, and enabled a couple of packages.

Thanks in advance,

Hernan
