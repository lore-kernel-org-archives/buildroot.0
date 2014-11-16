From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Nov 2014 22:48:51 +0100
Subject: [Buildroot] [PATCH 1/2] packae/duma: do not build test programs
In-Reply-To: <1416146673-29582-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 16 Nov 2014 15:04:32 +0100")
References: <1416146673-29582-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87k32uerzw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Building test programs fails for a static link, because duma.a redefines
 > memcpy and strcpy, which are already present in the C library.

 > Fixes quite some build failures:
 >     http://autobuild.buildroot.net/results/3c7/3c7a4751c7ca71ad429c2d67f380aa225f151350/ (arm)
 >     http://autobuild.buildroot.net/results/358/358293d22ae24237719f0aa27e88e87d03856973/ (x86_64)
 >     http://autobuild.buildroot.net/results/947/9472d78b890639d3204e1942491f1eae62fb8a36/ (powerpc)
 >     http://autobuild.buildroot.net/results/ffd/ffd2e7ab7a6045f5eeaa25cd25088ad0a5b6509a/ (i686)
 >     ...

 > Also rename patches according to the new naming scheme.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
