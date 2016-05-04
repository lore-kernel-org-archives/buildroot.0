From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 May 2016 22:44:56 +0200
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.2h
In-Reply-To: <1462286373-24276-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 3 May 2016 11:39:33 -0300")
References: <1462286373-24276-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oa8lpn7b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-2105 - Fix EVP_EncodeUpdate overflow
 > CVE-2016-2106 - Fix EVP_EncryptUpdate overflow
 > CVE-2016-2107 - Prevent padding oracle in AES-NI CBC MAC check
 > CVE-2016-2109 - Prevent ASN.1 BIO excessive memory allocation
 > CVE-2016-2176 - EBCDIC overread

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
