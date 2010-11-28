From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Nov 2010 11:09:06 +0100
Subject: [Buildroot] [PATCH] target-finalize: fix libthread_db strip fix
In-Reply-To: <1290897792-22134-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Sat, 27 Nov 2010 17:43:12 -0500")
References: <1290897792-22134-1-git-send-email-vapier@gentoo.org>
Message-ID: <87hbf1220t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> The attempt to fix libthread_db for some targets broke others.  If you
 Mike> want to match more libs, you shouldn't do so by breaking others.  The
 Mike> correct SONAME is libthread_db.so.#.

Out of interest, what targets got broken, and how are the libthread_db
files called?

-- 
Bye, Peter Korsgaard
