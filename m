From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 20:06:14 +0100
Subject: [Buildroot] [PATCH 2/2] package/tcpdump: bump to version 4.99.0
In-Reply-To: <52e8d711bf5b239729edaef5edf614a1dd4ff27e.1611249364.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 21 Jan 2021 19:16:04 +0200")
References: <b121a9435d868681c957e7bc9243fb84676d80e3.1611249364.git.baruch@tkos.co.il>
 <52e8d711bf5b239729edaef5edf614a1dd4ff27e.1611249364.git.baruch@tkos.co.il>
Message-ID: <87wnw47pw9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop upstream security patch.
 > Rename --with-system-libpcap to --disable-local-libpcap following
 > upstream change.

 > The configure scripts uses pkg-config to find libpcap, add host-pkgconf
 > dependency.

 > pkg-config handles static build for us. Remove explicit static build
 > handling.

 > Use https for SITE to save redirect.

 > Update license file hash due to whitespace changes.

 > Format hashes with two space delimiters.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
