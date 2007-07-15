From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 15 Jul 2007 12:40:24 +0200
Subject: [Buildroot] _VER vs. _VERSION breakage
Message-ID: <20070715104024.GB4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf,

Your change to use _VERSION broke at least acpid. Please double-check
that all packages that you touched in this patch still build fine and
repair.

thanks,
