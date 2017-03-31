From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 13:36:00 +0200
Subject: [Buildroot] [PATCH] pcre: add upstream security fixes
In-Reply-To: <fccce84215ce3160b0ab6d38e5f58a4188af174e.1490958576.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 31 Mar 2017 14:09:36 +0300")
References: <fccce84215ce3160b0ab6d38e5f58a4188af174e.1490958576.git.baruch@tkos.co.il>
Message-ID: <87r31dvftr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Take Debian adapted patches of upstream.
 > Fixes:

 > CVE-2017-6004: crafted regular expression may cause denial of service

 > CVE-2017-7186: invalid Unicode property lookup may cause denial of service

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

There are other pending security issues, E.G. CVE-2017-7244:

https://blogs.gentoo.org/ago/2017/03/20/libpcre-invalid-memory-read-in-_pcre32_xclass-pcre_xclass-c/

But I can take care of that.

-- 
Bye, Peter Korsgaard
