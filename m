From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Mar 2015 21:51:06 +0100
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.2a
In-Reply-To: <1426775680-12864-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 19 Mar 2015 11:34:40 -0300")
References: <1426775680-12864-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lhisiudh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-0291 - ClientHello sigalgs DoS
 > CVE-2015-0290 - Multiblock corrupted pointer
 > CVE-2015-0207 - Segmentation fault in DTLSv1_listen
 > CVE-2015-0286 - Segmentation fault in ASN1_TYPE_cmp
 > CVE-2015-0208 - Segmentation fault for invalid PSS parameters
 > CVE-2015-0287 - ASN.1 structure reuse memory corruption
 > CVE-2015-0289 - PKCS7 NULL pointer dereferences
 > CVE-2015-0293 - DoS via reachable assert in SSLv2 servers
 > CVE-2015-1787 - Empty CKE with client auth and DHE
 > CVE-2015-0285 - Handshake with unseeded PRNG
 > CVE-2015-0209 - Use After Free following d2i_ECPrivatekey error
 > CVE-2015-0288 - X509_to_X509_REQ NULL pointer deref

Argh!

Committed, thanks.

-- 
Bye, Peter Korsgaard
