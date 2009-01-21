From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 21:14:10 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <1232560373.11888.36.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Wed\, 21 Jan 2009 18\:52\:53 +0100")
References: <1232523725.11888.11.camel@elrond.atmel.com>
	<87vds9t51h.fsf@macbook.be.48ers.dk>
	<1232538049.11888.16.camel@elrond.atmel.com>
	<87wscosv1f.fsf@macbook.be.48ers.dk>
	<1232560373.11888.36.camel@elrond.atmel.com>
Message-ID: <87ljt4pgbx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> Here is the same with the 4.3.2/bu-2.19/uclib-0.9.30

 Ulf> mk	mplayer                        OK	

Just tried with arm926t, and it dies with an ICE in h263.c:

h263.c: In function 'h263_pred_motion':
h263.c:1710: error: unrecognizable insn:
(insn 81 80 82 11 h263.c:1678 (set (reg:SI 209)
        (const_int 2305843009213693948 [0x1ffffffffffffffc])) -1 (nil))
h263.c:1710: internal compiler error: in extract_insn, at recog.c:1990
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.

What arm variant are you testing with?

-- 
Bye, Peter Korsgaard
