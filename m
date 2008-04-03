From: Arun Reddy <reddyac@gmail.com>
Date: Thu, 3 Apr 2008 13:58:28 -0700
Subject: [Buildroot] Error when compiling Buildroot to create .iso (cannot
	stat /.../i386-linux-2.6.24-20080403)
Message-ID: <326f33790804031358n63fd21bs5ee753b194d3a89b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone.

I am able to successfully compile Buildroot and I end up with a resulting
file system image rootfs.i386.ext2 and a bzImage for the kernel. I want to
boot up my newly created kernel in VirtualBox, and I will need an .iso to do
that. So modified menuconfig to give me an .iso and typed make again.
Unfortunately I run into an error that states:

cp: cannot stat
'/root/buildroot/binaries/uclibc/i386-linux-2.6.24-20080403': No such file
or directory
make: *** [/root/buildroot/binaries/uclibc/rootfs.i386.iso] Error 1

I checked that folder and I see file named i386-linux-2.6.24-20080403, and
cannot understand why it is giving me this error. Can someone give me a
clearer indication to what this error is referring and how I can go about
fixing it?

Thank you in advance for your response!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080403/89fcbb6b/attachment.htm 
