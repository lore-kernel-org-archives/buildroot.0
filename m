From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Sep 2009 13:21:43 +0200
Subject: [Buildroot] Buildroot 2009.08 released
In-Reply-To: <20090901124503.723c313e@hcegtvedt.norway.atmel.com>
	(Hans-Christian Egtvedt's message of "Tue\,
	1 Sep 2009 12\:45\:03 +0200")
References: <87hbvoq9ae.fsf@macbook.be.48ers.dk>
	<871vmrq7dl.fsf@macbook.be.48ers.dk>
	<20090901124503.723c313e@hcegtvedt.norway.atmel.com>
Message-ID: <87ws4iq5a0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 Hans-Christian> Hmmm, why not do a 2009.08.01 release instead? Did you
 Hans-Christian> rebase the tag

I considered it, but found simply updating the 2009.08 version
better/easier/less error prone since the bug is so serious and the
release so new anyway.

The test config I built after fixing the util-linux issue (#529)
unfortunately didn't have busybox enabled so I didn't notice until after
the release :/

Getting buildbot running should certainly help these situations.

 Hans-Christian> in GIT? (too lazy to check).

No, I simply removed and recreated the tag.

-- 
Bye, Peter Korsgaard
