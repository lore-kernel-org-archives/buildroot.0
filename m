From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Sep 2009 09:23:26 +0200
Subject: [Buildroot] [PATCH 1/5] Remove the "project" feature
In-Reply-To: <1252394155.13520.2.camel@bender> (Sven Neumann's message of
	"Tue\, 08 Sep 2009 09\:15\:55 +0200")
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<a57f463ae7b50d932282ded660a431251e1de379.1252361088.git.thomas.petazzoni@free-electrons.com>
	<20090908082707.18e19d6e@hcegtvedt.norway.atmel.com>
	<1252393123.11390.5.camel@bender> <87hbvd52z7.fsf@macbook.be.48ers.dk>
	<1252394155.13520.2.camel@bender>
Message-ID: <87d461528h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 >> We have that already with the external toolchain support. I also don't
 >> use it yet (we're doing like you), but will start to use it soon.

 Sven> So how would I go about reusing the buildroot supplied tool-chain
 Sven> for multiple targets? I imagine that one basic target would build
 Sven> the tool-chain and the other targets would then use that as their
 Sven> external tool-chain? Could you give an example or a quick
 Sven> introduction on how to set this up? Or just point me to the docs
 Sven> if I just missed that such documentation exists. That would be
 Sven> much appreciated.

Yes, something like that. Have you read
http://buildroot.net/buildroot.html#external_toolchain ? As I said
before, I haven't actually used it yet, maybe Thomas can fill in the
blanks?

It might be an idea to get the toolchain build to write out a .config
snippet that can get included when using it to ensure we have the
various toolchain settings correct.

-- 
Bye, Peter Korsgaard
