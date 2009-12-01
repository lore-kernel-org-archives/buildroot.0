From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Dec 2009 15:49:34 +0100
Subject: [Buildroot] external toolchain
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJsvlB0+B11LmskjkLHLmJkBAAAAAA==@cimeq.qc.ca>
	(Jonathan dumaresq's message of "Tue, 1 Dec 2009 08:59:46 -0500")
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJsvlB0+B11LmskjkLHLmJkBAAAAAA==@cimeq.qc.ca>
Message-ID: <877ht6lpfl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jonathan" == Jonathan dumaresq <jdumaresq@cimeq.qc.ca> writes:

 Jonathan> Hi all,
 Jonathan> Does any one here have used the crosstoll-ng for AVR32 with buildroot ?

Last I looked, crosstool-ng didn't support avr32-on-linux, only
barebone?

 Jonathan> Is it possible to use the toolchain build by buildroot and reusit as
 Jonathan> external toolchain ?

Yes, that should work OK.

-- 
Bye, Peter Korsgaard
