From: Brian Beattie <beattie@beattie-home.net>
Date: Tue, 24 Jun 2008 10:00:32 -0700 (PDT)
Subject: [Buildroot] building kernel modules
Message-ID: <QMgOp3TV.1214326832.4244410.beattie@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Does anybody here know how to build kernel modules for buildroot outside
the kernel tree?  Any documents or tutorials?  Everything I've found so
far covers self-hosted builds and does not seem to work for
cross-compiling.

I'm working inside the kernel tree, but that is a little clumsy.

Baring that, how about forcing a kernel recompile, "make linux26" does
not seem to do it.
