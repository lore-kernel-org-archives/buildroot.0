From: Andreas Naumann <dev@andin.de>
Date: Mon, 17 Jun 2013 16:13:32 +0200
Subject: [Buildroot]  qt5: No SOURCES in qmake created Makefiles
Message-ID: <51BF198C.2040405@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

when using qt4 up till now I used the output/host/usr/bin/qmake to 
prepare out of tree projects/examples for compilation. Worked like a 
charm and i was very happy being able to use a consistent toolchain for 
that.
However when I try the same with the qt5 qmake binary, the the SOURCES 
of the .pro file (and maybe other options) dont make it into the 
Makefile. So running make results in "Nothing to do for target first". 
Have you or anybody else successfully compiled out of tree qt5 
applications and if so how? Or, are there any examples on writing a 
package for qt5 applications?


thanks and regards,
Andreas
