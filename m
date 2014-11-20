From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 19:40:26 +0100
Subject: [Buildroot] [PATCH] clamav: security bump to version 0.98.5
In-Reply-To: <1416501110-4513-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 20 Nov 2014 13:31:50 -0300")
References: <1416501110-4513-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d28hg1gl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2013-6497 - the jwplayer.js file causes ClamAV to seg fault when
 > scanned with the -a (list archived files).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
