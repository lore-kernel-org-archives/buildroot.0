From: David Schueler <webmaster@smsjava.de>
Date: Fri, 28 Sep 2007 12:14:37 +0200
Subject: [Buildroot] Building with kernel-headers 2.4.25 fails
Message-ID: <46FCD40D.20700@smsjava.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello list!

I'm new to buildroot and want to use it to compile some applications for
an embedded arm device which is using uClibc 0.9.26 and kernel 2.4.26.

Now i want to compile openvpn for that target, but since a couple of
days buildroot isn't supporting kernel 2.4.x anymore. The compile
process stops at:
make: *** No rule to make target
'/home/crossdev/buildroot/dl/linux-2.4.25.tar.bz2', needed by
`/home/crossdev/buildroot/toolchain_build_arm_nofpu/linux-2.4.25/.unpacked'. 

  Stop.

Will it ever be possible to compile kernel 2.4.x or is it removed until
now and will never come back into buildroot?
Or is there another - better - way to compile the toolchain and openvpn
for my emmbedded target?

Sorry, but i'm a really novice user in cross compiling.

Thanks for any suggentions.

David
