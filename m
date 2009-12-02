From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 02 Dec 2009 14:23:26 +0100
Subject: [Buildroot] [git tag 2009.11] update for 2009.11
In-Reply-To: <200912020701.52887.minimod@morethan.org> (Michael S. Zick's
	message of "Wed, 2 Dec 2009 07:01:50 -0600")
References: <20091201142204.3F954777B5@busybox.osuosl.org>
	<200912020701.52887.minimod@morethan.org>
Message-ID: <873a3tv7ap.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

 Michael> Would you please tag the repository with a 2010.02 branch tag?

Sorry, I prefer to branch for bugfix releases instead (if needed) - So
that master is always where development is happening.

 Michael> That way users can continue to fix 2009.11 without being exposed
 Michael> to the code-churn of producing 2010.02.

Just create a local branch from the 2009.11 tag:

git checkout -b mybranch 2009.11

 Michael> The "release and move-on" type of organization really is not appropriate
 Michael> for something as mission critical as the build system in use.

 Michael> Heck, after a decade, even kernel.org learned that lesson.  ;)

No they didn't. Linus' tree doesn't have branches, and stable (bugfix)
releases are done from a completely different tree.

-- 
Bye, Peter Korsgaard
