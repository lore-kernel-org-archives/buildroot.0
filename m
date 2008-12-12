From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Dec 2008 11:29:34 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
In-Reply-To: <20081212111450.7af4120c@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Fri\, 12 Dec 2008 11\:14\:50 +0100")
References: <20081212092938.291973C2E4@busybox.net>
	<87iqppr9lp.fsf@macbook.be.48ers.dk>
	<20081212111450.7af4120c@hcegtvedt>
Message-ID: <87ej0dr8j5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 >> Shouldn't this then be $(MAKE1) ?
 >> 

 Hans-Christian> Not needed, it is safe to parallel build the proto stuff. The problem
 Hans-Christian> is that the all: rule does not depend properly on proto.

Ok, it would probably be handy to add a small comment to explain why
it's done like this.

-- 
Bye, Peter Korsgaard
