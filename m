From: Matthias Hardt <matthias.hardt@gmail.com>
Date: Thu, 17 Oct 2013 10:26:33 +0200
Subject: [Buildroot] qt5webkit and bison 3.0
Message-ID: <20131017082633.GA13085@riot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the current buildroot-repository uses bison 3.0. When building qt5webkit,
there is a known incompatibility to this bison version [1].
For now I fixed this by using bison 2.7.1 when qt5webkit is chosen. Maybe this
should be done in the repository as well (at least while waiting for the 
qt5webkit 5.1.2 release which will fix this issue).

And some other minor inconvenience. qt5webkit needs dependencies to host-flex
and host-bison.

I can provide a patch for both issues, if needed.

Best regards,
Matthias

[1] https://bugreports.qt-project.org/browse/QTBUG-32913

-- 
Matthias Hardt
Software Developer

BerLinux Solutions GmbH
Torellstr. 7
10243 Berlin
Germany

E-Mail: mhardt at berlinux-solutions.de
Phone:  +49 30/86437990
