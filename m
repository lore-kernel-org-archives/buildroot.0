From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 16 Mar 2012 16:55:57 -0400
Subject: [Buildroot] scons, zxing and buildroot
Message-ID: <CA+-urNQdQwFYHxL+-ws5PmtNT6rzUtDYynsJmx+7E-wBLGgsFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I need to get a package integrated with buildroot that uses scons. I
haven't used scons before, and I'm not quite sure how to get it to
call the cross-compiler appropriately. Or at least, I haven't figured
out how to pass the compiler and compiler options on the command line
to it yet. I did notice that host-scons exists in buildroot, so it
seems like someone may have gotten a scons-based project to work. So
far, I haven't found any packages that actually reference it, so I was
wondering if anyone had an example. The library in question is the C++
port of the zxing library (http://code.google.com/p/zxing/) in case
someone already has ported it.

Thanks,
Frank
