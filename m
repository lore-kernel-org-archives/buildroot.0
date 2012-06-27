From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Jun 2012 00:31:51 +0200
Subject: [Buildroot] xbmc available in (for Rpi)
In-Reply-To: <CALR4fE+d=y4ANugDpWYo+eK1Vy+esN+UhfA1N-Lcfm4QiWifsA@mail.gmail.com>
 (Diego Iastrubni's message of "Wed, 27 Jun 2012 22:36:43 +0300")
References: <CAAfyv34srnfYZqxjQCxV-k0CPYVqwXK-zPBmB0UkoqrqGidShg@mail.gmail.com>
 <87wr2t5gq4.fsf@macbook.be.48ers.dk>
 <CALR4fEJQjcH7HVc-Hiq8YpgUPms+oyv=O4JwHqzR0PoLcKwZ2w@mail.gmail.com>
 <CALR4fE+d=y4ANugDpWYo+eK1Vy+esN+UhfA1N-Lcfm4QiWifsA@mail.gmail.com>
Message-ID: <87fw9g5qug.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Diego" == Diego Iastrubni <diegoiast@gmail.com> writes:

 Diego> I am missing something out here in git:

 Diego> cd ~/src/buildroot [where my buildroot clone is)
 Diego> git remote add rbp git://github.com/huceke/buildroot-rbp.git
 Diego> git fetch rbp

 Diego> Git is pulling now the whole remote repository. I was thinking it will
 Diego> only pull the "diff" between builroot and buildroot-rbp ... as they
 Diego> share a lot... no?

The rbp repo unfortunately seems to be a new import of a tree, and not
based on a clone of the upstream buildroot tree, so to git there is no
relation betweeen them.

-- 
Bye, Peter Korsgaard
