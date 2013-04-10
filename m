From: David Bonnin <dboml@free.fr>
Date: Wed, 10 Apr 2013 23:26:33 +0200
Subject: [Buildroot] use custom kernel headers
Message-ID: <5165D909.1060104@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We have modify/create linux kernel drivers (out of tree build with an 
other toolchain).
We try to include theses custom headers from our user space application.
What is the good way to handle these custom headers without rebuild 
toolchain each we modify our kernel driver?
We use for BR, an externel toolchain build with CTNG.
For the moment we've used a very dirty absolute include path in the 
Makefile.
-D/src/project/linux/drivers/myDriver/include/
Watch your experience in use of specific drivers headers?
I didn't seen a standard way to handle this in BR...

Thanks for any help.
