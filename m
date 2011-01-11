From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Jan 2011 10:52:34 +0100
Subject: [Buildroot] [PATCH 1/7] busybox: unify duplicated build steps
In-Reply-To: <1294669725-5379-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Mon, 10 Jan 2011 09:28:39 -0500")
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-1-git-send-email-vapier@gentoo.org>
Message-ID: <87wrmb3gyl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> This does set a few more vars in some steps that weren't set before, but
 Mike> they should be harmless in the contexts in question.  And the resulting
 Mike> save in duplication is nice.

Committed, thanks.

-- 
Bye, Peter Korsgaard
