From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 21:35:02 +0200
Subject: [Buildroot] [PATCH] libssh2: add mbedtls backend
In-Reply-To: <fea2729018dac49411877b2ee4813205dd1296fc.1499708154.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 10 Jul 2017 20:35:54 +0300")
References: <fea2729018dac49411877b2ee4813205dd1296fc.1499708154.git.baruch@tkos.co.il>
Message-ID: <87eftmsr6h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > libssh2 support mbedtls as crypto back-end library since version 1.8.0.
 > Default to mbedtls since it's smaller than either libgcrypt or openssl.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
