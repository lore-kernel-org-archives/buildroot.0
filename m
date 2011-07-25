From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Jul 2011 09:28:47 +0200
Subject: [Buildroot] [PATCH] toolchain: add user defined target LDFLAGS
	options
In-Reply-To: <20110725072406.GB13998@sapphire.tkos.co.il> (Baruch Siach's
 message of "Mon, 25 Jul 2011 10:24:07 +0300")
References: <b4ad3d880f9c9e43b70d43bf527593487f3b1035.1308820722.git.baruch@tkos.co.il>
 <87y5zmuauq.fsf@macbook.be.48ers.dk>
 <20110725071001.GA13998@sapphire.tkos.co.il>
 <87tyaau8xo.fsf@macbook.be.48ers.dk>
 <20110725072406.GB13998@sapphire.tkos.co.il>
Message-ID: <87livmu8cw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> Ok. That patch still needs some work (E.G. it only works with a single
 >> argument).

 Baruch> I see. Any other issue with that patch?

Not really. I think we should cleanup a bit all these options for
setting compiler/linker flags, but that's more of a long term goal.

The plan is to put out 2011.08-rc1 at the end of the week, so I would
like to keep big changes for the next cycle.

-- 
Bye, Peter Korsgaard
