From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 13:04:18 +0100
Subject: [Buildroot] [PATCH 1/2] libgcrypt: security bump to version
	1.6.3
In-Reply-To: <1425121753-25802-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 28 Feb 2015 08:09:12 -0300")
References: <1425121753-25802-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wq32xmwt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-3591 - Use ciphertext blinding for Elgamal decryption
 > CVE-2015-0837 - Fixed data-dependent timing variations in modular
 > exponentiation.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
