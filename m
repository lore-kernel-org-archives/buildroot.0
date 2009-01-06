From: Mark Jackson <mpfj@mimc.co.uk>
Date: Tue, 06 Jan 2009 13:25:17 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <87d4f0tzjb.fsf@macbook.be.48ers.dk>
References: <20081228160857.E48AE76D44@busybox.osuosl.org>	<496342D2.3090705@mimc.co.uk>
	<87d4f0tzjb.fsf@macbook.be.48ers.dk>
Message-ID: <49635BBD.4090207@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Mark" == Mark Jackson <mpfj@mimc.co.uk> writes:
> 
> Hi,
> 
>  Mark> This patch fails when I make openssl.  Below is the make output
>  Mark> and the rejects file.
> 
> Ahh, It's because the avr32 specific patch apparently also makes the
> same change as openssl-0.9.8g-uclibc-susv3-legacy.patch, which it
> ofcourse shouldn't do. I have fixed it in r24696.
> 

Thank you ... it all compiles without error now.

Cheers
Mark
