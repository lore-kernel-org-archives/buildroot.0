From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Mar 2016 15:06:28 +0100
Subject: [Buildroot] [PATCH] cpio: add security patch to fix
	CVE-2016-2037
In-Reply-To: <1457009885-5903-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 3 Mar 2016 09:58:05 -0300")
References: <1457009885-5903-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oaav8xln.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-2037 - The cpio_safer_name_suffix function in util.c in cpio
 > 2.11 allows remote attackers to cause a denial of service (out-of-bounds
 > write) via a crafted cpio file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
