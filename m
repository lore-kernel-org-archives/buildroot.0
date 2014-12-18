From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Dec 2014 22:55:37 +0100
Subject: [Buildroot] [PATCH] linux-pam: add security patches
In-Reply-To: <1418925881-20012-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 18 Dec 2014 15:04:41 -0300")
References: <1418925881-20012-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mw6khbc6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > To fix:
 > CVE-2013-7041 - use case sensitive comparison in pam_userdb
 > CVE-2014-2583 - potential path traversal issue in pam_timestamp

 > Also add hash file (computed, the hash files upstream cover up to 1.1.7)

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
