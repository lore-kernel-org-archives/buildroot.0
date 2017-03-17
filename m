From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Mar 2017 00:37:39 +0100
Subject: [Buildroot] [PATCH] mbedtls: security bump to verison 2.4.2
In-Reply-To: <20170315180836.29157-1-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Wed, 15 Mar 2017 15:08:36 -0300")
References: <20170315180836.29157-1-gustavo@zacarias.com.ar>
Message-ID: <87lgs3mq4c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2017-2784 - Freeing of memory allocated on stack when validating a
 > public key with a secp224k1 curve.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
