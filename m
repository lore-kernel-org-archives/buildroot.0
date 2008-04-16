From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 16 Apr 2008 10:52:38 +0200
Subject: [Buildroot] [patch] AVR32: rename atstk1002 target board to more
	generic	atstk100x
Message-ID: <1208335958.23163.4.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please consider applying the linked patch:

http://www.atmel.no/~hcegtvedt/patches/0001-AVR32-rename-atstk1002-target-board-to-more-generic.patch

This patch renames the Atmel atstk1002 target board to a more generic
atstk100x name. This to make it easier to add support for other
CPU-boards than atstk1002.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>

Applies clean to snapshot from 20080416.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
