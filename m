From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Tue, 1 Dec 2009 10:32:18 -0500
Subject: [Buildroot] external toolchain
In-Reply-To: <877ht6lpfl.fsf@macbook.be.48ers.dk>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJsvlB0+B11LmskjkLHLmJkBAAAAAA==@cimeq.qc.ca>
	<877ht6lpfl.fsf@macbook.be.48ers.dk>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAACNuCF48xw1HpPFsEHb2JAYBAAAAAA==@cimeq.qc.ca>
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

>>>>> "Jonathan" == Jonathan dumaresq <jdumaresq@cimeq.qc.ca> writes:

 Jonathan> Hi all,
 Jonathan> Does any one here have used the crosstoll-ng for AVR32 with
buildroot ?

Last I looked, crosstool-ng didn't support avr32-on-linux, only
barebone?

 Jonathan> Is it possible to use the toolchain build by buildroot and reusit
as
 Jonathan> external toolchain ?

Yes, that should work OK.

Good news. Is it possible to build only the toolchain ?

Jonathan

-- 
Bye, Peter Korsgaard

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

Ce message entrant est certifi? sans virus connu.
Analyse effectu?e par AVG - www.avg.fr 
Version: 9.0.709 / Base de donn?es virale: 270.14.88/2538 - Date: 12/01/09
02:59:00
