From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Apr 2012 19:14:29 +0200
Subject: [Buildroot] [PATCH 1/2] busybox 1.20.x: add if-post-up.d and
	if-pre-down.d to device table
In-Reply-To: <1335704632-23164-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 29 Apr 2012 10:03:51 -0300")
References: <1335704632-23164-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ipgi5ukq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Busybox 1.20.0 add functionality to execute scripts from
 Gustavo> if-post-up.d and if-pre-down.d, so add the missing directories
 Gustavo> to the device table to get them created and avoid unnecessary
 Gustavo> warnings if not.

Committed, thanks.

-- 
Bye, Peter Korsgaard
