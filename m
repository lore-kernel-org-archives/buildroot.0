From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 10:24:51 +0100
Subject: [Buildroot] avahi dependencies on host tools
Message-ID: <20091216102451.339e6ba9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried to build the avahi package on a freshly installed Ubuntu system
(which has almost zero development related packages installed), and the
build failed because it couldn't find "intltool" on the host.

Should we build this tool ourself, or should we rely on the user to
install it ?

This tool itself relies on Perl. Can we assume that host Perl is a
mandatory dependency of Buildroot, or should we also build Perl ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
