From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Jul 2018 22:19:12 +0200
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.61.0
In-Reply-To: <afd8c54be27becb281c564d1c041c7bc1b1b5a87.1531419357.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 12 Jul 2018 21:15:57 +0300")
References: <afd8c54be27becb281c564d1c041c7bc1b1b5a87.1531419357.git.baruch@tkos.co.il>
Message-ID: <87muuwurzz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-0500: curl might overflow a heap based memory buffer when
 > sending data over SMTP and using a reduced read buffer.

 > Drop upstream patch.

 > Add reference to tarball signature key.

 > Drop CRYPTO_lock seed. Removed from configure script since 7.45.

 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
