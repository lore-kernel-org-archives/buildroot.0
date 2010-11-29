From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Nov 2010 08:57:01 +0100
Subject: [Buildroot] [PATCH] target-finalize: fix libthread_db strip fix
In-Reply-To: <201011281725.12551.vapier@gentoo.org> (Mike Frysinger's message
	of "Sun, 28 Nov 2010 17:25:11 -0500")
References: <1290897792-22134-1-git-send-email-vapier@gentoo.org>
	<201011281236.56902.vapier@gentoo.org>
	<8739ql177x.fsf@macbook.be.48ers.dk>
	<201011281725.12551.vapier@gentoo.org>
Message-ID: <87pqtozho2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> On Sunday, November 28, 2010 16:14:26 Peter Korsgaard wrote:
 >> Again, I know this is probably just you being you, but do take care of
 >> your choice of words. To me, this commit message sounds quite
 >> aggressive, as if you're upset that Javier's fix broke your

 Mike> truthfully, i am a bit annoyed that Javier or you didnt simply CC
 Mike> me and ask before breaking things.  it isnt like my e-mail is
 Mike> hidden or i'm AFK or otherwise hard to reach.  -mike

Correct. Buildroot people are normally subscribed to the BR list, but it
would have been good if you were CC'ed. The patch got committed fast
because it fixed real problems (E.G. it didn't work for any BR configs)
and we're just about to release.

Anyway, no harm done - Now both configurations work.

-- 
Bye, Peter Korsgaard
