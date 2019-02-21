From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:42:37 +0100
Subject: [Buildroot] [PATCH] package/jpeg-turbo: add upstream security
 fixes
In-Reply-To: <3e10488a1e8d65fddcd891ddc8188512aa955edc.1549978107.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 12 Feb 2019 15:28:27 +0200")
References: <3e10488a1e8d65fddcd891ddc8188512aa955edc.1549978107.git.baruch@tkos.co.il>
Message-ID: <8736ohtobm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2018-20330: Integer overflow causing segfault occurred when
 > attempting to load a BMP file with more than 1 billion pixels using the
 > `tjLoadImage()` function.

 > CVE-2018-19664: Buffer overrun occurred when attempting to decompress a
 > specially-crafted malformed JPEG image to a 256-color BMP using djpeg.

 > Cc: Murat Demirten <mdemirten@yh.com.tr>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
