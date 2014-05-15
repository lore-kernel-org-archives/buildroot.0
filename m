From: rajesh gandla <rajeshgandla3@gmail.com>
Date: Thu, 15 May 2014 11:49:32 +0530
Subject: [Buildroot] kernel compilation error by using buildroot
Message-ID: <CAAnJALe5BEN3T7WLr2h4kUEOEzxiwTtSisEOXo=dtA8Kmsvi5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas
                        I overcome all the issues in building the
xenomai and build root,the only one thing here is i am  unable to
configure the kernel by using build root.when ever i am trying to
configure the kernel its giving different kind of errors.here i am
attaching the screen shot,plz go through the screen shot and let me
know how to configure the kernel in buildroot.below i  mentioned the
errors while configure the kernel using buildroot.

1.make[1]: Leaving directory
`/home/systemuser/xenomai_BEL/rajesh_xenomai/buildroot-2012.11/support/kconfig'
#
# configuration written to
/home/systemuser/xenomai_BEL/rajesh_xenomai/buildroot-2012.11/.config
#


*** End of the configuration.
*** Execute 'make' to start the build or try 'make help'.


One more error is

2,r/xenomai_BEL/xenomai_om/buildroot-2014.02/output/build/buildroot-config/conf
--silentoldconfig Config.in

*** Error during update of the configuration.

make[1]: *** [silentoldconfig] Error 1
make[1]: Leaving directory
`/home/systemuser/xenomai_BEL/xenomai_om/buildroot-2014.02'
make: *** [/home/systemuser/xenomai_BEL/xenomai_om/buildroot-2014.02/output/build/buildroot-config/auto.conf]
Error 2


Please let me know the solution for this problem and how to configure
the kernel in build root.what are paths i have to give for kernel
configuration.


Best Regards
Rajesh G
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernelconfiguration.png
Type: image/png
Size: 90658 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140515/5572f61d/attachment-0001.png>
