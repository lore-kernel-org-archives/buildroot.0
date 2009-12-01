From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Tue, 1 Dec 2009 09:38:30 -0500
Subject: [Buildroot] external toolchain
In-Reply-To: <20091201153315.210f2e33@surf>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJsvlB0+B11LmskjkLHLmJkBAAAAAA==@cimeq.qc.ca>
	<20091201153315.210f2e33@surf>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAKrXecPXdXJAuZO5zJNZeC0BAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

-----Message d'origine-----
De?: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] De
la part de Thomas Petazzoni
Envoy??: 1 d?cembre 2009 09:33
??: buildroot at busybox.net
Objet?: Re: [Buildroot] external toolchain

Le Tue, 1 Dec 2009 08:59:46 -0500,
"Jonathan dumaresq" <jdumaresq@cimeq.qc.ca> a ?crit :

> Does any one here have used the crosstoll-ng for AVR32 with
> buildroot ?

The AVR32 support in Crosstool-NG is bare-meta only (based on newlib).
So such a toolchain cannot be used in Buildroot. You'd first have to
contribute to Crosstool-NG to add support for uClibc and/or glibc.

This is what I though. 

Thanx for your help again, and save me some hours....

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-- 
