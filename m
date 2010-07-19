From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 Jul 2010 07:15:49 +0200
Subject: [Buildroot] Full config files for each board are yucky.
In-Reply-To: <AANLkTimWP0NejW9l0IQSazcaldVaJu0dySV8bGsqh3Wo@mail.gmail.com>
	(Mitch Davis's message of "Mon, 19 Jul 2010 12:29:36 +1000")
References: <AANLkTimWP0NejW9l0IQSazcaldVaJu0dySV8bGsqh3Wo@mail.gmail.com>
Message-ID: <87hbjwuk56.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mitch" == Mitch Davis <mjd+buildroot@afork.com> writes:

Hi,

 Mitch> <rant>That *every* defconfig file needs to be changed indicates a
 Mitch> failing of the present system, where we have pre-canned config files
 Mitch> for every board, that need ongoing maintenance whenever something in
 Mitch> the Kconfig files change.</rant>

Agreed, I was thinking of running Uwe's reduce script:

http://lkml.org/lkml/2010/7/13/134

 Mitch> I have an alternative config system where every board inherits config
 Mitch> options from something else (ultimately the defaults in the config
 Mitch> system), then a board can turn on and off and set options which are
 Mitch> relevant to that board.  BR2_GIT would only need to be changed in one
 Mitch> place, if at all.  I'll clean it up and publish it, if anyone's
 Mitch> interested...

What would that buy us compared to Uwe's script? Would that involve
significant changes to package/config making updates harder?

-- 
Bye, Peter Korsgaard
