From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 13:25:30 +0200
Subject: [Buildroot] [PATCH] gnupg: security bump to version 1.4.22
In-Reply-To: <10033e7b173d98374eac45d28e1fb97f68e82118.1504094464.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 30 Aug 2017 15:01:04 +0300")
References: <10033e7b173d98374eac45d28e1fb97f68e82118.1504094464.git.baruch@tkos.co.il>
Message-ID: <87bmmof4r9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Mitigate a flush+reload side-channel attack on RSA secret keys
 > dubbed "Sliding right into disaster".  For details see
 > <https://eprint.iacr.org/2017/627>.  [CVE-2017-7526]

 > Switch to https site for better firewall compatibility and security.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
