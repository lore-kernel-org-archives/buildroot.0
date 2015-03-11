From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 22:15:08 +0100
Subject: [Buildroot] [PATCH] vsftpd: add security fix for CVE-2015-1419
In-Reply-To: <1426096753-32723-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 11 Mar 2015 14:59:13 -0300")
References: <1426096753-32723-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zj7jjkwz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2015-1419 - config option deny_file is not handled correctly.
 > Also add hash file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
