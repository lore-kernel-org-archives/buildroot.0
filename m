From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Oct 2009 20:41:00 +0200
Subject: [Buildroot] [PATCH 6/6] remove superfluous OPTIMIZE and DEBUG
	config knobs
In-Reply-To: <4bf0f4eae22ac9a6b1afa4621ff32b3f43887a85.1254853146.git.rep.dot.nop@gmail.com>
	(Bernhard Reutner-Fischer's message of "Tue\,
	6 Oct 2009 20\:26\:08 +0200")
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
	<6fe0ac8fa1f42152f604ca708aff08b8f119073a.1254853146.git.rep.dot.nop@gmail.com>
	<582a63d745311a980a8700a2a0ec17c3ae0f5ca9.1254853146.git.rep.dot.nop@gmail.com>
	<5959e530273437a31071499009cecc7a7e9ab461.1254853146.git.rep.dot.nop@gmail.com>
	<cover.1254853146.git.rep.dot.nop@gmail.com>
	<4bf0f4eae22ac9a6b1afa4621ff32b3f43887a85.1254853146.git.rep.dot.nop@gmail.com>
Message-ID: <871vlg2wn7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard> There is BR2_TARGET_OPTIMIZATION that is saved in the .config

I'm not sure. I think the existing config is pretty user friendly. If we
could do this, then we should probably rename it to
BR2_TARGET_EXTRA_CFLAGS or something like that so it's clear that you
should use it for all extra flags.

-- 
Bye, Peter Korsgaard
