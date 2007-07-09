From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 09 Jul 2007 06:16:48 +0200
Subject: [Buildroot] gnuconfig not up to date,
	but update gives conflicts during merge
Message-ID: <1183954608.5534.32.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Checked if gnuconfig was up to date
Seems it was not, but cvs up was not clean.
What do we do?


? testsuite/.svn
cvs update: Updating .
P ChangeLog
RCS file: /cvsroot/config/config/config.guess,v
retrieving revision 1.349
retrieving revision 1.366
Merging differences between 1.349 and 1.366 into config.guess
M config.guess
RCS file: /cvsroot/config/config/config.sub,v
retrieving revision 1.340
retrieving revision 1.356
Merging differences between 1.340 and 1.356 into config.sub
rcsmerge: warning: conflicts during merge
cvs update: conflicts found in config.sub
C config.sub
P uname
cvs update: Updating testsuite
P testsuite/config-guess.data
P testsuite/config-sub.data

Best Regards
Ulf Samuelsson
