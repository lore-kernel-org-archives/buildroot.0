From: Adam McLaurin <buildroot@irotas.net>
Date: Wed, 22 Oct 2008 18:23:12 -0400
Subject: [Buildroot] Error building buildroot r23768
Message-ID: <1224714192.16050.1280744193@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am having problems building buildroot r23768 on both my home and work
Ubuntu boxes. I get the same error on both:

...
mkdir -p /home/irotas/sandboxes/buildroot/project_build_i686//root/etc
echo -svn23768
>/home/irotas/sandboxes/buildroot/project_build_i686//root/etc/br-version
P /home/irotas/sandboxes/buildroot/dl
/linux/kernel/v2.6//linux-...tar.bz2
make: P: Command not found
make: [/home/irotas/sandboxes/buildroot/dl/linux-...tar.bz2] Error 127
(ignored)
*** Using kernel-headers generated from kernel source
rm -rf /home/irotas/sandboxes/buildroot/toolchain_build_i686/linux
[ -d /home/irotas/sandboxes/buildroot/toolchain_build_i686 ] ||
/usr/bin/install -d
/home/irotas/sandboxes/buildroot/toolchain_build_i686
/home/irotas/sandboxes/buildroot/dl/linux-...tar.bz2 | tar -C
/home/irotas/sandboxes/buildroot/toolchain_build_i686   -xf -
/bin/sh: /home/irotas/sandboxes/buildroot/dl/linux-...tar.bz2: not found
tar: This does not look like a tar archive
tar: Error exit delayed from previous errors
make: ***
[/home/irotas/sandboxes/buildroot/toolchain_build_i686/linux-../.unpacked]
Error 2



I've attached the complete output of 'make' if it's needed.

Any suggestions on how to troubleshoot this?

Thanks,
Adam


P.S. The uClibc website has pre-compiled uClibc development systems, but
warns "that the images mentioned above are old". How old is "old"? Would
it really be terrible to just use one of these images?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: make.log
Type: application/octet-stream
Size: 1898 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081022/274cb8b8/attachment.obj 
