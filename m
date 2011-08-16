From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Aug 2011 21:16:08 +0200
Subject: [Buildroot] [git commit] usbmount: depend on udev rather than
	selecting it
In-Reply-To: <20110815143204.GC22429@sapphire.tkos.co.il> (Baruch Siach's
 message of "Mon, 15 Aug 2011 17:32:04 +0300")
References: <20110815121044.054CD8C8E3@busybox.osuosl.org>
 <20110815143204.GC22429@sapphire.tkos.co.il>
Message-ID: <87sjp1f9qf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 >> comment "usbmount requires a toolchain with LARGEFILE + WCHAR support"
 >> -	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 >> +	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR) && BR2_PACKAGE_UDEV

 Baruch> Shouldn't the comment text be updated to indicate the udev dependency?

Well, we could - but we normally only show those comment lines for
toolchain dependencies  - E.G. you don't see 100s of comments for each
X11-related package if you haven't enabled Xorg.

udev is just above usbmount as well.

-- 
Bye, Peter Korsgaard
