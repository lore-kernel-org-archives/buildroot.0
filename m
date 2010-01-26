From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Jan 2010 13:18:17 +0100
Subject: [Buildroot] [PATCH] SDL needs tslib to be compiled first when
	selected.
In-Reply-To: <1264507483-25049-1-git-send-email-julien.boibessot@free.fr>
	(julien boibessot's message of "Tue, 26 Jan 2010 13:04:43 +0100")
References: <1264507483-25049-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <87eildqcty.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

 julien> From: Julien Boibessot <julien.boibessot@armadeus.com>

 julien> If SDL is built before tslib, then SDL can't detect it at
 julien> configure time and so touchscreen's support in SDL is crappy.

Committed, thanks!

-- 
Bye, Peter Korsgaard
