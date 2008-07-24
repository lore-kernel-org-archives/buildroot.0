From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 24 Jul 2008 16:43:09 +0200
Subject: [Buildroot] Makefile.autotools.in does not work well with projects
Message-ID: <1216910589.29392.18.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile.autotools.in uses a rule which touches a
stamp_target_installed file, this does not work well with projects.

The Makefile should depend on a file on the target root file system,
file not there => install to target again.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
