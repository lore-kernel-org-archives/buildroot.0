From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Aug 2016 09:20:27 +0200
Subject: [Buildroot] [PATCH] libgcrypt: security bump to version to
	version 1.7.3
In-Reply-To: <5d03002e20fce24f208b804c7f2d68c0955e325c.1471498983.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 18 Aug 2016 08:43:03 +0300")
References: <5d03002e20fce24f208b804c7f2d68c0955e325c.1471498983.git.baruch@tkos.co.il>
Message-ID: <87zioapmpw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2016-6316: Bug in the mixing functions of Libgcrypt's random number
 > generator. An attacker who obtains 4640 bits from the RNG can trivially
 > predict the next 160 bits of output.

Committed, thanks.

The announcement also talks about a new gnupg release. Will you also
send a bump to 1.4.21?

-- 
Bye, Peter Korsgaard
