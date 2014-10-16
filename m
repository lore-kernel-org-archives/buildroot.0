From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Oct 2014 08:04:46 +0200
Subject: [Buildroot] [PATCH] samba: fix config symbols
In-Reply-To: <1413329346-25534-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 14 Oct 2014 20:29:06 -0300")
References: <1413329346-25534-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vbnko8ht.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Some of the configure cache symbols changed name because some routines
 > were moved to libreplace instead of samba itself.
 > So change the naming for those affected so that samba can work nicely
 > again with some configuration directives (like interfaces = X).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
