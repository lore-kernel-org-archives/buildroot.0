From: Steve Kenton <skenton@ou.edu>
Date: Tue, 08 Sep 2015 12:14:22 -0500
Subject: [Buildroot] What would it take to add LZIP support for package
	downloads?
Message-ID: <55EF176E.4050001@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to set up a package for ddrescue
https://www.gnu.org/software/ddrescue/

and it's only available compressed with lzip (tar.lz)
http://www.nongnu.org/lzip/lzip.html

A manual trial run seems to indicate that it's not a supported format for downloaded packages

>>> ddrescue 1.19 Extracting
/ssd/bcdist/buildroot-2015.05/dl/ddrescue-1.19.tar.lz | tar --strip-components=1 -C /ssd/bcdist/buildroot-2015.05/output/build/ddrescue-1.19  -xf -
/bin/bash: /ssd/bcdist/buildroot-2015.05/dl/ddrescue-1.19.tar.lz: Permission denied
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors

So, what would it take to add lzip support for downloaded packages?
Easy or Oh My?

Steve Kenton
