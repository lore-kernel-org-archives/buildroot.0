From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 20:16:49 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231268529.32308.222.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Tue\, 06 Jan 2009 20\:02\:09 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
	<1231268529.32308.222.camel@elrond.atmel.com>
Message-ID: <87y6xomehq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> You have not said anything so far, on how you would like
 Ulf> to support distributions.

Distributions? What kind of distributions?

 Ulf> If you plan to take the current structure and just 
 Ulf> start to remove/deprecate and label with BROKEN
 Ulf> then I am afraid that this will cause a lot of problems.

Why? More that the current situation?

 Ulf> We should also replacing svn with git.

One thing at the time. git infrastructure on uclibc.org has been
discussed in connection with the break in / reinstall. It probably
makes most sense to move buildroot to git when the other uclibc
projects do.

-- 
Bye, Peter Korsgaard
