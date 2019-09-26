From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 10:51:19 +0200
Subject: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 1.1.1d
In-Reply-To: <20190917132318.3070-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 17 Sep 2019 15:23:18 +0200")
References: <20190917132318.3070-1-peter@korsgaard.com>
Message-ID: <8736gj8mpk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - ECDSA remote timing attack (CVE-2019-1547)
 >   Severity: Low

 > - Fork Protection (CVE-2019-1549)
 >   Severity: Low

 > - Padding Oracle in PKCS7_dataDecode and CMS_decrypt_set1_pkey (CVE-2019-1563)
 >   Severity: Low

 > For more details, see the advisory:
 > https://www.openssl.org/news/secadv/20190910.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
