From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Nov 2010 12:38:12 +0100
Subject: [Buildroot] [PATCH] target-finalize: fix libthread_db strip fix
In-Reply-To: <201011290618.25214.vapier@gentoo.org> (Mike Frysinger's message
	of "Mon, 29 Nov 2010 06:18:24 -0500")
References: <1290897792-22134-1-git-send-email-vapier@gentoo.org>
	<201011281725.12551.vapier@gentoo.org>
	<87pqtozho2.fsf@macbook.be.48ers.dk>
	<201011290618.25214.vapier@gentoo.org>
Message-ID: <87zkssxsuz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> On Monday, November 29, 2010 02:57:01 Peter Korsgaard wrote:
 >> The patch got committed fast because it fixed real problems (E.G. it didn't
 >> work for any BR configs)

 Mike> to be clear, there was no change in behavior before and after my
 Mike> first patch for people using symlinks to SONAMEs.  the file was
 Mike> always stripped before, and it was always stripped after if the
 Mike> SONAME was a symlink.

True, but that behaviour was not in sync with the commit message,
leading to the fix.

-- 
Bye, Peter Korsgaard
