From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2015 22:35:17 +0100
Subject: [Buildroot] [PATCH] libpng: security bump to version 1.6.19
In-Reply-To: <1447364586-9443-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 12 Nov 2015 18:43:06 -0300")
References: <1447364586-9443-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87io55lh0q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > png_set_PLTE/png_get_PLTE functions failed to check for
 > an out-of-range palette when reading or writing PNG files with a bit_depth
 > less than 8.

 > CVE not yet assigned.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
