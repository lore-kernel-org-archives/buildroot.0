From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Feb 2015 00:52:00 +0100
Subject: [Buildroot] [PATCH] ntp: security bump to version 4.2.8p1
In-Reply-To: <dcf52f41fdc85c275b1762dd1b1d45c52085cfb8.1423572397.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 10 Feb 2015 14:46:37 +0200")
References: <dcf52f41fdc85c275b1762dd1b1d45c52085cfb8.1423572397.git.baruch@tkos.co.il>
Message-ID: <87d25h1g0v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes:
 > CVE-2014-9297 - vallen is not validated in several places in ntp_crypto.c,
 > leading to a potential information leak or possibly a crash

 > CVE-2014-9298 - ::1 can be spoofed on some OSes (including "some versions" of
 > Linux), so ACLs based on IPv6 ::1 addresses can be bypassed

 > Drop a patch applied upstream, along with its accompanied AUTORECONF.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
