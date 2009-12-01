From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Tue, 1 Dec 2009 15:16:52 -0500
Subject: [Buildroot] external toolchain
In-Reply-To: <877ht6lpfl.fsf@macbook.be.48ers.dk>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJsvlB0+B11LmskjkLHLmJkBAAAAAA==@cimeq.qc.ca>
	<877ht6lpfl.fsf@macbook.be.48ers.dk>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAO5pZ1vqswxDqVFerD/3MDIBAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

-----Message d'origine-----
De?: Peter Korsgaard [mailto:jacmet at gmail.com] De la part de Peter Korsgaard
Envoy??: 1 d?cembre 2009 09:50
??: Jonathan dumaresq
Cc?: buildroot at busybox.net
Objet?: Re: [Buildroot] external toolchain


 Jonathan> Is it possible to use the toolchain build by buildroot and reusit
as
 Jonathan> external toolchain ?

Yes, that should work OK.

I got this error when I try to use the external toolchain

Checking external toolchain settings
External toolchain doesn't support --sysroot. Cannot use.
exit 1
make: *** [/buildroot/buildroot/cth/stamps/ext-toolchain-installed] Error 1

I build the external from buildroot

Jonathan

-- 
Bye, Peter Korsgaard
