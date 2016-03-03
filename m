From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Mar 2016 15:07:52 +0100
Subject: [Buildroot] [PATCH] exim: security bump to version 4.86.2
In-Reply-To: <1457009899-5948-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 3 Mar 2016 09:58:19 -0300")
References: <1457009899-5948-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k2lj8xjb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-1531 - All installations having Exim set-uid root and using
 > 'perl_startup' are vulnerable to a local privilege escalation. Any user
 > who can start an instance of Exim (and this is normally *any* user) can
 > gain root privileges. If you do not use 'perl_startup' you *should* be
 > safe.

We don't seem to have any perl support in our exim, but ok - Better safe
than sorry. Committed, thanks.

-- 
Bye, Peter Korsgaard
