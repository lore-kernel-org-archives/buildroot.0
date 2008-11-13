From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Nov 2008 15:23:34 +0100
Subject: [Buildroot] Server administration,
	and does buildroot have a maintainer?
In-Reply-To: <200811091949.03358.rob@landley.net> (Rob Landley's message of
	"Sun\, 9 Nov 2008 19\:49\:02 -0600")
References: <200811091949.03358.rob@landley.net>
Message-ID: <87r65fso0p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rob" == Rob Landley <rob@landley.net> writes:

Hi,

 Rob> The web page still says Buildroot's maintainer is Erik Andersen,
 Rob> who seems kind of busy with other things these days, has handed
 Rob> off all the other projects on this server, and last posted to
 Rob> this list 8 months ago.

Yeah, Erik basically doesn't do any uclibc.org work anymore, buildroot
or otherwise.

BR doesn't have a single maintainer, but I'm one of the old timers (so
is Bernhard, but he forked).

 Rob> I ask because Morris got cracked earlier today, and over on
 Rob> freenode we're discussing reinstalling it with Gentoo Embedded.
 Rob> The crack itself was just an automated script kiddie
 Rob> compromising apache, and didn't even seem to notice _what_
 Rob> server their bots had hit.  Denys spotted it within 24 hours,
 Rob> and OSUOSL has good backups so they could confirm the data seems
 Rob> to be fine, but it's generally a good idea to reinstall after
 Rob> getting rootkitted _anyway_.

Yeah :/

 Rob> We're looking at gentoo embedded because then we'd be dogfooding
 Rob> uClibc and busybox, which is cool.  (No, buildroot is not an
 Rob> option; you have no package management, and the project has
 Rob> still never had an actual _release_.

/me mumbles something about getting a release out "soon" - But yeah.

I personally prefer Debian, but whatever floats your boat - As long as
stuff works you won't hear me complain. Lets just keep things simple.

 Rob> Bernhard and Denys have been pinged, and if buildroot has a
 Rob> maintainer I'd like to keep him/her in the loop.  (If said
 Rob> maintainer is still Erik, then he's aware of the crack already,
 Rob> he just said he didn't have time to properly deal with it just
 Rob> now and delegated it back to the rest of us.)

I would like to be kept in the loop.

-- 
Bye, Peter Korsgaard
