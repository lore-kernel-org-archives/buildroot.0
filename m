From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 22:39:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/cvs: add license
In-Reply-To: <20200509211511.GT12536@scaer> (Yann E. MORIN's message of "Sat, 
 9 May 2020 23:15:11 +0200")
References: <20200509144709.3442939-1-fontaine.fabrice@gmail.com>
 <20200509211511.GT12536@scaer>
Message-ID: <875zd3r0ck.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fabrice, All,
 > On 2020-05-09 16:47 +0200, Fabrice Fontaine spake thusly:
 >> CVS is licensed under GPL-1.0+ as stated in README (referenced in source
 >> code) and COPYING files.
 >> COPYING.LIB also give the terms of LGPL-2.0+ but it does not seem to be
 >> referenced in the source code (it is only referenced in ChangeLog and
 >> Makefile.in)
 >> 
 >> Also update indentation in hash file (two spaces)
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > So, LGPL-2.0+ turned out to actually been in use, at least by one file,
 > lib/strnlen1.c, so I've added it to the license list, and COPYING.LIB
 > to the list of license files.

 > Additionally, LGPL-2.1+ is also use, by lib.glob.c, so I've added that
 > license to the list, along with lib/glob-libc.h to the license files.

 > I've also added hashes for those two license files.

 > Applied to master with those fixes, thanks.

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
