From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 13:00:24 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <496342D2.3090705@mimc.co.uk> (Mark Jackson's message of "Tue\,
	06 Jan 2009 11\:38\:58 +0000")
References: <20081228160857.E48AE76D44@busybox.osuosl.org>
	<496342D2.3090705@mimc.co.uk>
Message-ID: <87d4f0tzjb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Jackson <mpfj@mimc.co.uk> writes:

Hi,

 Mark> This patch fails when I make openssl.  Below is the make output
 Mark> and the rejects file.

Ahh, It's because the avr32 specific patch apparently also makes the
same change as openssl-0.9.8g-uclibc-susv3-legacy.patch, which it
ofcourse shouldn't do. I have fixed it in r24696.

-- 
Bye, Peter Korsgaard
