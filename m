From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Dec 2009 21:32:29 +0100
Subject: [Buildroot] external toolchain
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAO5pZ1vqswxDqVFerD/3MDIBAAAAAA==@cimeq.qc.ca>
	(Jonathan dumaresq's message of "Tue, 1 Dec 2009 15:16:52 -0500")
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJsvlB0+B11LmskjkLHLmJkBAAAAAA==@cimeq.qc.ca>
	<877ht6lpfl.fsf@macbook.be.48ers.dk>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAO5pZ1vqswxDqVFerD/3MDIBAAAAAA==@cimeq.qc.ca>
Message-ID: <87k4x6v3j6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jonathan" == Jonathan dumaresq <jdumaresq@cimeq.qc.ca> writes:

Hi,

 Jonathan> I got this error when I try to use the external toolchain

 Jonathan> Checking external toolchain settings
 Jonathan> External toolchain doesn't support --sysroot. Cannot use.

And did you enable sysroot support (BR2_TOOLCHAIN_SYSROOT)?

-- 
Bye, Peter Korsgaard
