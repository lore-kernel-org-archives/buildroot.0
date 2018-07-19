From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:41:20 +0200
Subject: [Buildroot] [PATCH 2/2] bind: fix build with zlib
In-Reply-To: <86b9b3c29162e451879854fe975eb7c4ba96945b.1531939984.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 18 Jul 2018 21:53:04 +0300")
References: <f6a81f45eeaea33eaa9015355bd7c63779f7b881.1531939984.git.baruch@tkos.co.il>
 <86b9b3c29162e451879854fe975eb7c4ba96945b.1531939984.git.baruch@tkos.co.il>
Message-ID: <87pnziaoov.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The bind configure.in now checks for "${with_zlib}/include/zlib.h".
 > Remove the redundant "include/".

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
