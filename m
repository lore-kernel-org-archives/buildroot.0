From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jun 2016 08:46:18 +0200
Subject: [Buildroot] [PATCH 5/6] docs/manual/known-issues: remove
	occurrences of eglibc
In-Reply-To: <ef5036d6-a366-ba13-bcbb-8b3b2357a93c@mind.be> (Arnout
 Vandecappelle's message of "Wed, 29 Jun 2016 01:03:18 +0200")
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160613204653.GG3786@free.fr> <87d1n1jbvs.fsf@dell.be.48ers.dk>
 <ef5036d6-a366-ba13-bcbb-8b3b2357a93c@mind.be>
Message-ID: <87r3bgijb9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I don't know. Perhaps it would be better to have these notes closer to
 >> the package? Perhaps as comment lines in the Config.in or part of the
 >> help text?

 >  I'm in favour of the help text. It doesn't hurt to have relatively
 >  long help text.

Me too. I think these things are too big / not important enough to show
through comment lines.

 >  It's still not ideal because people will only consult help text for packages
 > they actively select, not for automatically selected packages. But there isn't
 > much we can do better than that. Or we'd have to add infra to print some "known
 > issue" text in case of build failure :-P

Gaah, lets not go there ;)

-- 
Venlig hilsen,
Peter Korsgaard 
