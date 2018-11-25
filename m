From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 22:26:16 +0100
Subject: [Buildroot] [PATCH] nginx: security bump to 1.15.6
In-Reply-To: <20181109100820.10293-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 9 Nov 2018 11:08:19 +0100")
References: <20181109100820.10293-1-peter@korsgaard.com>
Message-ID: <87wop03l3b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-16843: Excessive memory usage in HTTP/2

 > CVE-2018-16844: Excessive CPU usage in HTTP/2

 > CVE-2018-16845: Memory disclosure in the ngx_http_mp4_module

 > Refreshed patch 0004 + 0007 as they no longer applied cleanly.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
