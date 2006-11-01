From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 1 Nov 2006 14:23:36 +0000 (UTC)
Subject: [Buildroot] Persistent tarball repository
Message-ID: <loom.20061101T151612-639@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I found to my annoyance that 'make distclean' clears out your downloaded .tar.gz
files in /dl, which could be a pain if you hadn't realised that (and was, since
there appears to be a problem with ftp.kernel.org so I got the file 'manually')

May I ask if there is a setting to allow these files to be cached somewhere that
'distclean' doesn't clear out ?
Might also be useful on a server in a team environment to ensure everyone
uses the same reference downloads without local duplication and time penalty.

Regards,
MikeW
