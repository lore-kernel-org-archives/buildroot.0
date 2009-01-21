From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 21:58:52 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <1232560373.11888.36.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Wed\, 21 Jan 2009 18\:52\:53 +0100")
References: <1232523725.11888.11.camel@elrond.atmel.com>
	<87vds9t51h.fsf@macbook.be.48ers.dk>
	<1232538049.11888.16.camel@elrond.atmel.com>
	<87wscosv1f.fsf@macbook.be.48ers.dk>
	<1232560373.11888.36.camel@elrond.atmel.com>
Message-ID: <87d4egpe9f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> Here is the same with the 4.3.2/bu-2.19/uclib-0.9.30

 Ulf> mk	libconfuse                     FAIL	""

Builds here after r24944.

 Ulf> mk	ntp                            FAIL	""

Builds here.

 Ulf> mk	openssh                        FAIL	""

Builds here.

 Ulf> mk	openssl                        OK	

Failed before, but builds after r24943.

 Ulf> mk	libcurl                        FAIL	""

Builds here.

 Ulf> mk	libtheora                      FAIL	""

Dies with an ICE:

dec/fragment.c: In function 'oc_frag_recon_inter2_c':
dec/fragment.c:83: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.

 Ulf> mk	mpg123                         FAIL	""

Dies with an ICE:

layer2.c: In function 'II_step_two':
layer2.c:251: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.

 Ulf> mk	directfb                       FAIL	""

Builds here.

 Ulf> mk	u-boot                         FAIL	""

Builds here.

-- 
Bye, Peter Korsgaard
