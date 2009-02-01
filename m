From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Feb 2009 14:17:03 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
In-Reply-To: <1233485886.5742.4.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Sun\, 01 Feb 2009 11\:58\:06 +0100")
References: <20090131225336.4E3377621A@busybox.osuosl.org>
	<20090201055814.GA8215@cloud.net.au>
	<87zlh6is7q.fsf@macbook.be.48ers.dk>
	<1233485886.5742.4.camel@elrond.atmel.com>
Message-ID: <878woqi9f4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> ?As long as you allow a commit to the main tree without
 Ulf> testing by others you will have a problem.

 Ulf> I have proposed to go to git, but that was not of interest
 Ulf> until the uclibc project did so.

Who says it's not of interest? I'm pretty sure the general agreement
is that we'll move to git sooner or later, and the same was discussed
during the uclibc.org reinstall. Back then we had more urgent issues
to handle, and not all is taken care of yet (E.G. issues from the old
bugtracker, the commit mails are still using the wrong URLs and so
on).

Just getting git up and running is easy (hey, it's installed on
uclibc.org so we could have it NOW), it's all the extra things like
gitweb/cgit, commit messages to the mailing list, a maintainers system
with submaintainers and an agreed upon procedure for finally getting
changes in the official (E.G. mine) tree.

A lot of these infrastructure issues would be shared with
busybox/uclibc as well, so it makes sense to sync.

But we can certainly discuss how to handle the BR specific procedures
so we're ready (either here on the list or IRL at FOSDEM).

-- 
Bye, Peter Korsgaard
