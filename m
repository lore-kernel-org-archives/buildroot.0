From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 23:25:24 +0100
Subject: [Buildroot] [PATCH] (e)glibc: add security patches for
	CVE-2014-7817
In-Reply-To: <1417101542-12008-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 27 Nov 2014 12:19:02 -0300")
References: <1417101542-12008-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878uiwnuwb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-7817 - command execution in wordexp() with WRDE_NOCMD specified

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
