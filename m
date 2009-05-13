From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 May 2009 13:51:13 +0200
Subject: [Buildroot] Obtaining old SVN revision
In-Reply-To: <4A0AA1D9.1030808@carallon.com> (Will Wagner's message of "Wed\,
	13 May 2009 11\:32\:57 +0100")
References: <4A0AA1D9.1030808@carallon.com>
Message-ID: <87r5ytrzke.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Hello all,

 Will> Following the transition to git how can I checkout buildroot to
 Will> a specific SVN revision?

 Will> I had hoped that the SVN repository would remain read only for a while
 Will> but it seems to have gone away. Presumably I can clone git and then
 Will> checkout back to the revision I want, I'm just not sure how to specify
 Will> that in git. Do I just have to work out what date the SVN revision
 Will> was?

Hmm, that's a mistake - svn should continue to work (read only). I'll
check with the osuosl.org guys. We don't have any links with the
correspondence between svn and git revisions, but I still have my
git-svn tree, so if you give me the svn rev, then I'll look up the
corresponding git revision.

You can checkout older git revisions with git checkout <rev>. Normally
you can also use the date based syntax (see man git-rev-parse) like:

git show @{2009-05-01}, but the commit dates are not correct for the
pre-git commits.

-- 
Bye, Peter Korsgaard
