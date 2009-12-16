From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 Dec 2009 21:20:06 +0100
Subject: [Buildroot] OT: git workflow question
In-Reply-To: <hgbei7$jgr$2@ger.gmane.org> (Grant Edwards's message of "Wed, 16
	Dec 2009 20:05:27 +0000 (UTC)")
References: <hgb3a3$88l$1@ger.gmane.org> <20091216203728.1ddc624c@surf>
	<hgbei7$jgr$2@ger.gmane.org>
Message-ID: <87ocly658p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 >> No. You should have made your changes in a separate branch
 >> instead of a master branch.

 Grant> Thanks.  That's the clue I was missing.  The tutorials I had
 Grant> read on git didn't say that -- they showed all work being done
 Grant> in the master branch.

That can work for quick edits, but then you need to remove the commit
before pulling updates in (git reset --hard origin/master).
I would recommend just creating a branch instead though as it's so
easy/fast to do in git (and it allows you to use git-rebase).

 >> This is at least how I'm contributing to Buildroot. Not
 >> necessarly the cleanest way, I'm no git expert.

 Grant> I certainly sounds like a better approach that what I was doing.

And it's what I would consider the "normal" way of working (it's atleast
how I do it when I contribute something to a project using git).

-- 
Bye, Peter Korsgaard
