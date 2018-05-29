From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 17:00:07 +0200
Subject: [Buildroot] [PATCH v2] glibc: security bump to latest 2.27
 branch
In-Reply-To: <e76f9b170cf1376b2b1603aa2e4503091f2771d9.1527604674.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 29 May 2018 17:37:54 +0300")
References: <e76f9b170cf1376b2b1603aa2e4503091f2771d9.1527604674.git.baruch@tkos.co.il>
Message-ID: <87bmcy7big.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixed issues are listed in the 2.27 branch NEWS file:
 >   CVE-2017-18269: An SSE2-based memmove implementation for the i386
 >   architecture could corrupt memory.  Reported by Max Horn.

 >   CVE-2018-11236: Very long pathname arguments to realpath function could
 >   result in an integer overflow and buffer overflow.  Reported by Alexey
 >   Izbyshev.

 >   CVE-2018-11237: The mempcpy implementation for the Intel Xeon Phi
 >   architecture could write beyond the target buffer, resulting in a buffer
 >   overflow.  Reported by Andreas Schwab.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: Format the version string as described in the comment (Peter)

Committed, thanks.

Will you also send a patch for 2018.02.x?

-- 
Bye, Peter Korsgaard
