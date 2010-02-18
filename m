From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Feb 2010 11:12:35 +0100
Subject: [Buildroot] [PATCH] alsamixer now seems to need libform,
	libmenu & libpanel (from ncurses)
In-Reply-To: <1265905885-31942-1-git-send-email-julien.boibessot@free.fr>
	(julien boibessot's message of "Thu, 11 Feb 2010 17:31:25 +0100")
References: <1265905885-31942-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <87mxz626p8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

 julien> From: Julien Boibessot <julien.boibessot@armadeus.com>
 julien> Without this patch alsamixer complains about missing libs and
 julien> ldd says:
 julien>         libform.so.5 => not found
 julien>         libmenu.so.5 => not found
 julien>         libpanel.so.5 => not found
 julien>         libncurses.so.5 => /usr/lib/libncurses.so.5 (0x4000e000)
 julien>         libasound.so.2 => /usr/lib/libasound.so.2 (0x40056000)
 julien>         ... <cut>

Committed, thanks.

-- 
Bye, Peter Korsgaard
