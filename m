From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Feb 2009 09:30:39 +0100
Subject: [Buildroot]
	svn	commit:	trunk/buildroot/target/device/Atmel/at91bootstrap
In-Reply-To: <21805444.post@talk.nabble.com> (tigmac's message of "Tue\,
	3 Feb 2009 00\:23\:37 -0800 \(PST\)")
References: <21805444.post@talk.nabble.com>
Message-ID: <87ljsngbww.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "tigmac" == tigmac  <chromy@asix.cz> writes:

Hi,

 tigmac> Unfortunately this is not the only problem, even if Makefile
 tigmac> is corrected, there is an #include missing in
 tigmac> driver/nandflash.c causing the compilation to fail. In other
 tigmac> words version 2.10 is buggy like hell, at least concerning
 tigmac> NADN flash.  Unless you are willing to fix it yourself, I
 tigmac> recommend using version 2.4.

Ok. I don't have any at91 hw, so I don't know anything about it.

Ulf, you bumped the at91bootstrap version recently - What's up?

 tigmac> BTW if I would like to submit a patch for AT91Bootstrap,
 tigmac> where should I send it so that it makes its way info the
 tigmac> official release?

Don't know, somewhere at Atmel I guess - Ulf?

-- 
Bye, Peter Korsgaard
