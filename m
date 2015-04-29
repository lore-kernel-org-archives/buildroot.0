From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Apr 2015 23:04:21 +0200
Subject: [Buildroot] [PATCH] clamav: security bump to version 0.98.7
In-Reply-To: <1430333241-3582-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 29 Apr 2015 15:47:21 -0300")
References: <1430333241-3582-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87iocey7ca.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-2221 - infinite loop condition on crafted y0da cryptor file.
 > CVE-2015-2668 - infinite loop condition on a crafted "xz" archive file.
 > CVE-2015-2305 - possible heap overflow in Henry Spencer's regex library.
 > CVE-2015-2170 - crash in upx decoder with crafted file.
 > CVE-2015-2222 - crash on crafted petite packed file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
