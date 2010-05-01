From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 01 May 2010 22:12:06 +0200
Subject: [Buildroot] [PATCH] Fix build of matchbox-keyboard and
	matchbox-wm
In-Reply-To: <20100429195046.6772.8942.stgit@localhost.localdomain> (Paulius
	Zaleckas's message of "Thu, 29 Apr 2010 22:50:46 +0300")
References: <20100429195046.6772.8942.stgit@localhost.localdomain>
Message-ID: <874oir7561.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> From: Darius Augulis <augulis.darius@gmail.com>
 Paulius> These packages have buggy configure script. It adds -L/lib flag
 Paulius> for linker and thus wrong libraries are linked in.
 Paulius> Workaround this issue by setting expat=yes in configure
 Paulius> environment.

Committed, thanks.

-- 
Bye, Peter Korsgaard
