From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Feb 2011 21:42:39 +0100
Subject: [Buildroot] [PATCH 0/8] Update GNU config support.
In-Reply-To: <AANLkTikOo9+wsqSNNLRPLJncArhW22BhXa6eV5Vu=QhU@mail.gmail.com>
	(Will Newton's message of "Fri, 25 Feb 2011 17:46:15 +0000")
References: <AANLkTikOo9+wsqSNNLRPLJncArhW22BhXa6eV5Vu=QhU@mail.gmail.com>
Message-ID: <87zkpjq20w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> We currently use a version of config.sub that is nearly 4 years old
 Will> and a version of config.guess that is nearly 2 years old.

 Will> Since this package was last updated GNU config has merged a
 Will> couple of patches and moved to git. This means we cannot use cvs
 Will> up to update it any more, so we can get rid of all the files that
 Will> were kept around for that purpose.

 Will>  23 files changed, 455 insertions(+), 2779 deletions(-)

Always nice to see such a diffstat ;)

Sounds good, will take a closer look at it post-2011.02.

-- 
Bye, Peter Korsgaard
