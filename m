From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:04:26 +0200
Subject: [Buildroot] [PATCH] qpdf: security bump to version 8.1.0
In-Reply-To: <f3824d1a8cf1971f29912fa0891ba7e597066d2d.1530249538.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 29 Jun 2018 08:18:58 +0300")
References: <f3824d1a8cf1971f29912fa0891ba7e597066d2d.1530249538.git.baruch@tkos.co.il>
Message-ID: <87tvovee39.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-9918: mishandle certain "expected dictionary key but
 > found non-name object" cases, allowing remote attackers to cause a
 > denial of service (stack exhaustion)

 > https://github.com/qpdf/qpdf/issues/202

 > Drop local SHA256 hash since we use upstream provided SHA512.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
