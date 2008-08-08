From: hartleys <hartleys@visionengravers.com>
Date: Thu, 7 Aug 2008 22:11:42 -0400
Subject: [Buildroot] Package haserl does not install to root filesystem
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190960E889@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I have the haserl package selected (due to webif) but it does not get
installed when I do a make.

After the initial make is complete and the root filesystem exists in my
$(TARGET_DIR) I can do the following to get it to install:

$ make haserl-dirclean
$ make

Any ideas how to fix it?

Also, I'm not sure it matters but, the haserl.mk looks different than
most the other .mk that use AUTOTARGETS. It uses := instead of = to set
all the variables.

The ethtool, lighttpd, strace, and which packages are setup similarly.

Thanks,
Hartley
