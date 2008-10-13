From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Oct 2008 12:07:19 +0200
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG and Atmel targets
In-Reply-To: <48F1CE78.3040908@control.lth.se> (Anders Blomdell's message of
	"Sun\, 12 Oct 2008 12\:16\:24 +0200")
References: <48F1CE78.3040908@control.lth.se>
Message-ID: <87k5cc24h4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anders" == Anders Blomdell <anders.blomdell@control.lth.se> writes:

Hi,

 Anders> in target/device/Atmel/atngw100/Makefile.in there is a line
 Anders> BR2_PACKAGE_BUSYBOX_CONFIG:=$(BOARD_PATH)/busybox-1.9.1.config

Yes, this is done so specific boards can enforce certain
busybox/uclibc configurations. For most boards this is fine, but you
can ofcause start to question it for evaluation boards.

Either change the config that it points to or don't select that board
(or create your own board config based on the atngw).

-- 
Bye, Peter Korsgaard
