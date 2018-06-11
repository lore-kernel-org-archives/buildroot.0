From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 23:12:53 +0200
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.60.0
In-Reply-To: <c80a6fad0f71e02beda054135fc6e2e2f4ed2a0f.1526612436.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 18 May 2018 06:00:36 +0300")
References: <c80a6fad0f71e02beda054135fc6e2e2f4ed2a0f.1526612436.git.baruch@tkos.co.il>
Message-ID: <87a7s1auy2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop upstream patch.
 > This release fixes the security issues listed below.

 > CVE-2018-1000300: curl might overflow a heap based memory buffer when
 > closing down an FTP connection with very long server command replies.

 >   https://curl.haxx.se/docs/adv_2018-82c2.html

 > CVE-2018-1000301: curl can be tricked into reading data beyond the end
 > of a heap based buffer used to store downloaded content.

 >   https://curl.haxx.se/docs/adv_2018-b138.html

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
