From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 13 Dec 2006 18:58:35 +0000 (UTC)
Subject: [Buildroot] Using external toolchain / disabling Buildroot toolchain
Message-ID: <loom.20061213T195208-342@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot cannot build a required toolchain, but I would still like
to use it to build everything else.

Is there a preferred way to disable building the toolchain, and to set
Buildroot to use an external toolchain instead ?

(This is 'inside-out' from the BR docs which say how to use the BR toolchain
from outside.)

Looking at the top-level Makefile, this looks as if it would involve
edits to the file(s).

Regards,
MikeW
