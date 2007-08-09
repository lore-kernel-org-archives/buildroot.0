From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 10 Aug 2007 02:37:08 +0300
Subject: [Buildroot] fontconfig patches are broken in r19202
Message-ID: <46BBA524.2090408@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

Got error when applying patches:

Applying fc-lang.patch using plaintext:
patching file fc-lang/fc-lang.c

Applying host-tools.patch using plaintext:
patching file fc-lang/Makefile.am
Hunk #1 FAILED at 23.
1 out of 1 hunk FAILED -- saving rejects to file fc-lang/Makefile.am.rej
patching file fc-case/Makefile.am
Hunk #1 FAILED at 23.
1 out of 1 hunk FAILED -- saving rejects to file fc-case/Makefile.am.rej
patching file fc-glyphname/Makefile.am
Hunk #1 FAILED at 23.
1 out of 1 hunk FAILED -- saving rejects to file fc-glyphname/Makefile.am.rej
patching file configure.in
Hunk #1 succeeded at 105 (offset 4 lines).
patching file fc-arch/Makefile.am
Hunk #1 FAILED at 23.
1 out of 1 hunk FAILED -- saving rejects to file fc-arch/Makefile.am.rej
Patch failed!  Please fix host-tools.patch!

-------------
fontconfig]# svn log
------------------------------------------------------------------------
r19202 | ulf | 2007-07-23 11:18:45 +0300 (Mon, 23 Jul 2007) | 1 line

Add fontconfig patches for cross-compile
------------------------------------------------------------------------
r18963 | aldot | 2007-06-28 17:03:04 +0300 (Thu, 28 Jun 2007) | 2 lines

- fix building the utilities that are ment to be run on the _HOST_ (Julien Letessier)

patches apply correctly only at r18963 but not at r19202.

Best regards,
Ivan
