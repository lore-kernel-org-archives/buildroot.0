From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 24 Jul 2009 15:02:42 +0200
Subject: [Buildroot] [git commit] CHANGES: add #163 + #473
In-Reply-To: <20090724110230.3f51597a@surf> (Thomas Petazzoni's message of
	"Fri\, 24 Jul 2009 11\:02\:30 +0200")
References: <20090724055230.2080B77660@busybox.osuosl.org>
	<20090724110230.3f51597a@surf>
Message-ID: <87zlauutcd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

hi,

 Thomas> Le Fri, 24 Jul 2009 07:51:16 +0200,
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

 >> +	#163: Xtensa architecture port

 Thomas> I might wrong or be missing something, but I haven't seen the
 Thomas> corresponding commits for this (maybe patches too large for
 Thomas> the list ?).

Yes, they are committed and I haven't seen the mails either - seems
like the commit hook has issues when I push multiple changes at once.

(Or it might be something else, I'm having mail and hw problems
today).

 Thomas> But if it was really committed, I was quite worried by the
 Thomas> complexity added by the ? overlay ? mechanism proposed by
 Thomas> this new architecture port, and that a public discussion on
 Thomas> this new mechanism could have been interesting to see if it's
 Thomas> the best solution, if it's the way we want Buildroot to go
 Thomas> forward, etc.

The patches were discussed on the list when they were first submitted,
afaik without much comments. the xtensa people have been asking about
it several times, and I finally promised to commit after 2009.05 was
released:

http://lists.busybox.net/pipermail/buildroot/2009-May/027503.html

I agree that the xtensa stuff is "special" in various ways, but I
think it's more productive to get it into git and then work on getting
it cleaned up more, instead of having it gather dust in bugzilla.

-- 
Bye, Peter Korsgaard
