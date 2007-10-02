From: Brian Austin <brian.austin@cirrus.com>
Date: Tue, 02 Oct 2007 16:51:40 -0500
Subject: [Buildroot] Adding Cirrus  EP93XX  ARM to buildroot
Message-ID: <1191361900.4187.48.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I would like to start the process of adding the Cirrus Logic EP93XX ARM9
family to buildroot.

couple things about the 93xx.

1.  Maverick Crunch  FPU.  I have patches for GCC/uClibc to enable
Crunch FPU.

2. Linux Kernel.  We have a patch for several current kernel versions up
to 2.6.21.5.

I also have patches for DirectFB which I submitted last week and QT,
TSLIB, and other BSP software which have not been submitted.

I also think there is a section for bootloaders as well?

Qustion is,  where to start?

Right now we give out a modified version of buildroot for the prebuilt
toolchain and a buildroot system for building the kernel, u-boot,
redboot (ecos), and BSP software.  But I want it to go into ya'lls to
make things more consistent.  it's hard for me to do everything here.
We use DirectFB/GTK now for our graphics and I had to change alot to get
it to build and install correctly to pass SQA testing, so hopefully that
can be of use as well.

anyway comments and suggestions on where to start would be great.

Regards,
Brian Austin
Cirrus Logic Inc. 
