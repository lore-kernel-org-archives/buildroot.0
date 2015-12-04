From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Dec 2015 21:46:53 +0100
Subject: [Buildroot] [PATCH] libpng: security bump to version 1.6.20
In-Reply-To: <1449179287-23960-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 3 Dec 2015 18:48:07 -0300")
References: <1449179287-23960-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a8pq7xhe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-8126 - incorrect implementation of png_set_PLTE() that uses
 > png_ptr not info_ptr, that left png_set_PLTE() open to this vuln.

 > (fix in previous release was incomplete)

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

Should this also be applied to the 2015.11.x branch?

-- 
Bye, Peter Korsgaard
