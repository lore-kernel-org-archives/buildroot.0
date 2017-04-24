From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:32:11 +0200
Subject: [Buildroot] [PATCH 2/2] libnss: security bump to version 3.30.2
In-Reply-To: <f4dcb1e701fce76f7f18bd8dfff60b1f2fdb2a4f.1492709669.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 20 Apr 2017 20:34:29 +0300")
References: <d86176bbf66ac3fbbdc5a47456314bd68006df13.1492709669.git.baruch@tkos.co.il>
 <f4dcb1e701fce76f7f18bd8dfff60b1f2fdb2a4f.1492709669.git.baruch@tkos.co.il>
Message-ID: <87pog1txdw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2017-5461 - Out-of-bounds write in Base64 encoding in NSS. Might cause
 > remote arbitrary code execution
 > (https://access.redhat.com/errata/RHSA-2017:1100).

 > CVE-2017-5462 - DRBG flaw in NSS

 > Drop 0001-cross-compile.patch and TARGET* variables. Upstream Makefile now
 > allows override of CC, so use TARGET_CONFIGURE_OPTS instead.

 > Drop upstream 0003-it-uninitialized-fix.patch.

 > Renumber the remaining patch.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > Backport note: depends on libnspr version 4.14

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
