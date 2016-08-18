From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Aug 2016 10:58:11 +0200
Subject: [Buildroot] [PATCH] gnupg: security bump to version 1.4.21
In-Reply-To: <4c3273437b9b93736b622a9d245f715f7fd9a75e.1471505951.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 18 Aug 2016 10:39:11 +0300")
References: <4c3273437b9b93736b622a9d245f715f7fd9a75e.1471505951.git.baruch@tkos.co.il>
Message-ID: <87r39mpi70.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2016-6313: An attacker who obtains 580 bytes from the standard RNG
 > can trivially predict the next 20 bytes of output.

 > Add cryptographically secure sha256 hash.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
