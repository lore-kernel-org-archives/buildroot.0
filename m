From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Dec 2014 21:42:26 +0100
Subject: [Buildroot] [PATCH] jasper: add patches to fix CVE-2014-8137
	and CVE-2014-8138
In-Reply-To: <1419013938-13645-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 19 Dec 2014 15:32:18 -0300")
References: <1419013938-13645-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87h9wrfk25.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-8137 - double-free in jas_iccattrval_destroy()
 > CVE-2014-8138 - heap overflow in jp2_decode()

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
