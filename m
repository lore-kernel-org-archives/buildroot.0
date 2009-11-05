From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Thu, 05 Nov 2009 13:59:59 -0800
Subject: [Buildroot] building kernel modules
Message-ID: <4AF34ADF.7090303@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am using buildroot to build a distro for an ARM ep9xx system.
Everything works great except for one kernel module. I am trying to
debug it, but it is a pain to make the whole kernel tree to insert a
single printk.  Also, it looks like I have to do "touch
<...>/.configured" to get the kernel to detect the change the compile a
new version of the module.

Is there any documentation regarding building kernel modules by
themselves after having built the main kernel?  Something similar to how
userlevel apps get cross compiled.  I suppose that somehow I need to
access all of the flags that buildroot passes to the kernel when it
builds it.

Ideally, I just want to just compile the module, and then insmod it over
the NFS rootfs.

Many Thanks,

Roman
