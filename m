From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Sep 2017 23:33:42 +0200
Subject: [Buildroot] [PATCH] faad2: security bump to version 2.8.1
In-Reply-To: <108fe39722b22a67f7737d6e174dc8483c784b95.1502254922.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 9 Aug 2017 08:02:02 +0300")
References: <108fe39722b22a67f7737d6e174dc8483c784b95.1502254922.git.baruch@tkos.co.il>
Message-ID: <87y3pskeyx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes: CVE-2017-9218, CVE-2017-9219, CVE-2017-9220, CVE-2017-9221,
 > CVE-2017-9222, CVE-2017-9223, CVE-2017-9253, CVE-2017-9254,
 > CVE-2017-9255, CVE-2017-9256, CVE-2017-9257

 > http://seclists.org/fulldisclosure/2017/Jun/32

 > Switch to .tar.bz2 to save some bandwidth.

 > Add autoreconf since unfortunately upstream tarball does not ship the
 > configure script.

 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
