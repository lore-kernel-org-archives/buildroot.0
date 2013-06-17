From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Jun 2013 16:22:13 +0200
Subject: [Buildroot] qt5: No SOURCES in qmake created Makefiles
In-Reply-To: <51BF198C.2040405@andin.de>
References: <51BF198C.2040405@andin.de>
Message-ID: <20130617162213.1fdc7d97@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Naumann,

On Mon, 17 Jun 2013 16:13:32 +0200, Andreas Naumann wrote:

> when using qt4 up till now I used the output/host/usr/bin/qmake to 
> prepare out of tree projects/examples for compilation. Worked like a 
> charm and i was very happy being able to use a consistent toolchain for 
> that.

Using output/host/usr/bin/qmake is indeed the correct way and is
supposed to do the right thing in terms of toolchain and flags and so
on.

> However when I try the same with the qt5 qmake binary, the the SOURCES 
> of the .pro file (and maybe other options) dont make it into the 
> Makefile.

Can you clarify exactly what happens?

> So running make results in "Nothing to do for target first". 
> Have you or anybody else successfully compiled out of tree qt5 
> applications and if so how? Or, are there any examples on writing a 
> package for qt5 applications?

It has been a few months now, but when I did the Qt5 packaging, I'm
pretty sure I did test a sample Hello World application that was
compiled "out of tree" (i.e not a Buildroot package) with
output/host/usr/bin/qmake. There may have been some regressions/issues
in the mean time, though.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
