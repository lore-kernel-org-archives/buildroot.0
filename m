From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Nov 2012 09:13:02 +0100
Subject: [Buildroot] [PATCH 1/2] Add missing dependency to netatalk
In-Reply-To: <50976E04.4060009@mind.be> (Arnout Vandecappelle's message of
 "Mon, 05 Nov 2012 08:43:00 +0100")
References: <1352057123-7137-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20121105075550.41dbed52@skate> <50976E04.4060009@mind.be>
Message-ID: <87ip9kpiwh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> host-pkg-config should now be host-pkgconf.
 >> 
 >> Peter, Arnout, shouldn't we be adding a dummy 'host-pkg-config' target
 >> in order to avoid breaking all external packages that are using
 >> host-pkg-config? Didn't we talk about not breaking APIs? :-)

 Arnout>  Seems like a good idea.

 Arnout>  But I would make it issue an error, so people update their .mk
 Arnout>  files.

 Arnout>  Maybe we can create a top-level Makefile.legacy and
 Arnout> Config.in.legacy that collects all the
 Arnout> API-compatibility-warnings-and-errors.  That makes it easier to
 Arnout> remove them later.

Sounds like a good idea. Care to cook up a patch?

-- 
Bye, Peter Korsgaard
