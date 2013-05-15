From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 May 2013 20:39:55 +0200
Subject: [Buildroot] [PATCH] xapp_xinit: revert removal
In-Reply-To: <1368472039-5128-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 13 May 2013 16:07:19 -0300")
References: <1368472039-5128-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87hai4ozno.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Even though xinit isn't included in the X11R7.7 release it is very
 Gustavo> useful for debugging and quick tests.
 Gustavo> Reinstante it without xdm requiring it though.

Committed, thanks.

-- 
Bye, Peter Korsgaard
