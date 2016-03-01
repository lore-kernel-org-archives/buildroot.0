From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Mar 2016 15:48:24 +0100
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.2g
In-Reply-To: <1456843116-18109-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 1 Mar 2016 11:38:36 -0300")
References: <1456843116-18109-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d1rel0ef.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-0800 - Cross-protocol attack on TLS using SSLv2 (DROWN)
 > CVE-2016-0705 - Double-free in DSA code
 > CVE-2016-0798 - Memory leak in SRP database lookups
 > CVE-2016-0797 - BN_hex2bn/BN_dec2bn NULL pointer deref/heap corruption
 > CVE-2016-0799 - Fix memory issues in BIO_*printf functions
 > CVE-2016-0702 - Side channel attack on modular exponentiation

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
