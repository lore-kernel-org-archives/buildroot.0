From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 17:48:56 +0200
Subject: [Buildroot] [PATCH 2018.02.x] glibc: security bump to latest
 2.26 branch
In-Reply-To: <a6279b2229c08c70e5e970d214264b102a240cc2.1527607683.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 29 May 2018 18:28:03 +0300")
References: <a6279b2229c08c70e5e970d214264b102a240cc2.1527607683.git.baruch@tkos.co.il>
Message-ID: <8736ya7993.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixed issues are listed in the 2.26 branch NEWS file:
 >   CVE-2017-18269: An SSE2-based memmove implementation for the i386
 >   architecture could corrupt memory.  Reported by Max Horn.

 >   CVE-2018-11236: Very long pathname arguments to realpath function could
 >   result in an integer overflow and buffer overflow.  Reported by Alexey
 >   Izbyshev.

 >   CVE-2018-11237: The mempcpy implementation for the Intel Xeon Phi
 >   architecture could write beyond the target buffer, resulting in a buffer
 >   overflow.  Reported by Andreas Schwab.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>


Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
