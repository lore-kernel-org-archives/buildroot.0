From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Oct 2009 13:30:54 +0200
Subject: [Buildroot] [PATCH 12/23] qt: respect silent mode instead non
	existing verbose mode
In-Reply-To: <20091007112738.GH10261@mx.loc> (Bernhard Reutner-Fischer's
	message of "Wed\, 7 Oct 2009 13\:27\:38 +0200")
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-13-git-send-email-mroth@nessie.de>
	<20091007115741.4f5e44df@surf> <200910071230.48080.mroth@nessie.de>
	<20091007112738.GH10261@mx.loc>
Message-ID: <87hbubmoep.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 Bernhard> can't you use the configure invocation of autotools.in?
 Bernhard> $(if $(VERBOSE),--verbose,$(if $(SILENT),--silent,))
 Bernhard> (modulo real names) i.e. if VERBOSE is set, use it, else maybe use
 Bernhard> silent or just leave it at defaults.

We already do something like that for QUIET, E.G. configure gets a -q
argument to make it shut up.

-- 
Bye, Peter Korsgaard
