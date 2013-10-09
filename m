From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 9 Oct 2013 20:37:35 +0200
Subject: [Buildroot] Building / installing kernel modules.
Message-ID: <8DEC37E638F84029919B5EB7D735370D@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Dear Thomas

I found this post http://lists.busybox.net/pipermail/buildroot/2011-July/044690.html

Has there been some infrastructure added to aid in building and installing kernel modules ?

I created a generic-package makefile to build and install the kernel module.
So far so good, but I still have to run depmod -a on my target to register the module.

How can I use the post_install hook to have the module registered by buildroot,
so I don't have to do it on my target board ?

Johan
