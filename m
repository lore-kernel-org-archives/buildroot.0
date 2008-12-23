From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 10:48:45 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/arch-avr32:
	kernel-patches-2.6.27.6
In-Reply-To: <20081220221939.4935476CEB@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 20 Dec 2008 22\:19\:39 +0000 \(UTC\)")
References: <20081220221939.4935476CEB@busybox.osuosl.org>
Message-ID: <873agf8bnm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-12-20 22:19:38 +0000 (Sat, 20 Dec 2008)
 ulf> New Revision: 24469

 ulf> Log:
 ulf> Add 2.6.27.7 patches for AVR32

 ulf> Added:
 ulf>    trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/

2.6.27.6 or 2.6.27.7? Don't they apply to 2.6.27.10?

Do we really need another ~800kb of avr specific patches? What about
the older patches, can they go away?

-- 
Bye, Peter Korsgaard
