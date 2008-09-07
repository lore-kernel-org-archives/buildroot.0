From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun, 7 Sep 2008 19:13:19 +0200
Subject: [Buildroot] directive without effect
Message-ID: <200809071913.19696.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

revision r19279 from 27.07.2007 uses an invalid variable name
CONFIG_BR2_PACKAGE_LINUX, so that the if-statement is always false. I don't
know the state, when the change was commited, so I'm not sure what to do.

a) remove CONFIG_ because BR2_PACKAGE_LINUX does exist
b) revert the commit as it apparently didn't cause problems without setting
   HOST_SOURCE

Markus
