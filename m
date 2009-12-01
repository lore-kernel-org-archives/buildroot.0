From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2009 15:33:15 +0100
Subject: [Buildroot] external toolchain
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJsvlB0+B11LmskjkLHLmJkBAAAAAA==@cimeq.qc.ca>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJsvlB0+B11LmskjkLHLmJkBAAAAAA==@cimeq.qc.ca>
Message-ID: <20091201153315.210f2e33@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 1 Dec 2009 08:59:46 -0500,
"Jonathan dumaresq" <jdumaresq@cimeq.qc.ca> a ?crit :

> Does any one here have used the crosstoll-ng for AVR32 with
> buildroot ?

The AVR32 support in Crosstool-NG is bare-meta only (based on newlib).
So such a toolchain cannot be used in Buildroot. You'd first have to
contribute to Crosstool-NG to add support for uClibc and/or glibc.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
