From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Mar 2018 10:34:51 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.59.0
In-Reply-To: <7128741177a05a7861260441801d38311867fe0f.1521137179.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 15 Mar 2018 20:06:19 +0200")
References: <7128741177a05a7861260441801d38311867fe0f.1521137179.git.baruch@tkos.co.il>
Message-ID: <873710icsk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2018-1000120: curl could be fooled into writing a zero byte out of
 > bounds when curl is told to work on an FTP URL with the setting to only
 > issue a single CWD command, if the directory part of the URL contains a
 > "%00" sequence.

 > https://curl.haxx.se/docs/adv_2018-9cd6.html

 > CVE-2018-1000121: curl might dereference a near-NULL address when
 > getting an LDAP URL.

 > https://curl.haxx.se/docs/adv_2018-97a2.html

 > CVE-2018-1000122: When asked to transfer an RTSP URL, curl could
 > calculate a wrong data length to copy from the read buffer.

 > https://curl.haxx.se/docs/adv_2018-b047.html

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
