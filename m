From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Dec 2009 16:34:58 +0100
Subject: [Buildroot] external toolchain
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAACNuCF48xw1HpPFsEHb2JAYBAAAAAA==@cimeq.qc.ca>
	(Jonathan dumaresq's message of "Tue, 1 Dec 2009 10:32:18 -0500")
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJsvlB0+B11LmskjkLHLmJkBAAAAAA==@cimeq.qc.ca>
	<877ht6lpfl.fsf@macbook.be.48ers.dk>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAACNuCF48xw1HpPFsEHb2JAYBAAAAAA==@cimeq.qc.ca>
Message-ID: <87y6lmk8rh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jonathan" == Jonathan dumaresq <jdumaresq@cimeq.qc.ca> writes:

Hi,

 Jonathan> Good news. Is it possible to build only the toolchain ?

Sure, just don't enable any packages / kernel / target file systems.

-- 
Bye, Peter Korsgaard
