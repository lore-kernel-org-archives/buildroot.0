From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 23:03:44 +0100
Subject: [Buildroot] [PATCH] libopenssl: security bump to version 1.0.2q
In-Reply-To: <20181129144740.29999-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 29 Nov 2018 15:47:40 +0100")
References: <20181129144740.29999-1-peter@korsgaard.com>
Message-ID: <87sgze2rpb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 >   *) Microarchitecture timing vulnerability in ECC scalar multiplication

 >      OpenSSL ECC scalar multiplication, used in e.g. ECDSA and ECDH, has been
 >      shown to be vulnerable to a microarchitecture timing side channel attack.
 >      An attacker with sufficient access to mount local timing attacks during
 >      ECDSA signature generation could recover the private key.

 >      This issue was reported to OpenSSL on 26th October 2018 by Alejandro
 >      Cabrera Aldaya, Billy Brumley, Sohaib ul Hassan, Cesar Pereida Garcia and
 >      Nicola Tuveri.
 >      (CVE-2018-5407)
 >      [Billy Brumley]

 >   *) Timing vulnerability in DSA signature generation

 >      The OpenSSL DSA signature algorithm has been shown to be vulnerable to a
 >      timing side channel attack. An attacker could use variations in the signing
 >      algorithm to recover the private key.

 >      This issue was reported to OpenSSL on 16th October 2018 by Samuel Weiser.
 >      (CVE-2018-0734)
 >      [Paul Dale]

 > For more information, see the changelog:
 > https://www.openssl.org/news/cl102.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
