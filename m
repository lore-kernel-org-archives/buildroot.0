From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 16 Apr 2010 16:18:18 +0000 (UTC)
Subject: [Buildroot] Where does 'BOARD_NAME' Makefile.in variable come from?
Message-ID: <hqa2ka$uek$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm looking at the default config files and Makefile.in files for the
Atmel boards, and they all reference a variable named "BOARD_NAME".
For example from target/device/Atmel/at91sam9261ek/Makefile.in:

ifeq ($(strip $(BOARD_NAME)),at91sam9261ek)
LINUX_BOARD_NAME:=at91sam9261ek
...

And from at91sam9263ek_defconfig

BR2_TARGET_AT91BOOTSTRAP_BOARD="$(BOARD_NAME)"

But, I can't figure out where BOARD_NAME comes from or how it differs
from BR2_BOARD_NAME.  Can somebody point me towards a clue?

-- 
Grant Edwards               grant.b.edwards        Yow! My LESLIE GORE record
                                  at               is BROKEN ...
                              gmail.com            
