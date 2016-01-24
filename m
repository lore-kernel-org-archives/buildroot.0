From: jerry at chordia.co.uk <jerry@chordia.co.uk>
Date: Sun, 24 Jan 2016 15:40:49 -0000
Subject: [Buildroot] BR 2015.11 External kernel questions?
Message-ID: <002601d156bd$9a00b3c0$ce021b40$@chordia.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is working really well to produce embedded x86_64 images. Thanks to
all. 2 questions:

 

I'm building a 4.4 kernel from an external local directory and want to
clarify the dependency management. If I change the kernel configuration in
the linux-4.4 directory, do I need to do a make clean in the buildroot
directory? To date I have been so doing to avoid complications but as the
process has stabilised I'm looking to see if I can reduce build times.

 

Second, I need to do some experiments with Xenomai. If I'm using an external
kernel (probably something like 4.1.x) how do I manage the xenomai patch
process? I can see an option in the kernel extensions section but am not
quite sure *what* it is going to do? Pull and apply a patch? Or does it
expect the patching to have been done prior to a build?

 

TKY.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160124/2e433303/attachment.html>
