From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Nov 2014 20:45:51 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-23
In-Reply-To: <87sih8u3it.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 24 Nov 2014 14:33:30 +0100")
References: <20141124073015.9A70D1016F6@stock.ovh.net>
 <20141124130530.GA2420@tarshish> <87sih8u3it.fsf@dell.be.48ers.dk>
Message-ID: <87fvd8tma8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
 >> Hi Peter,
 >> On Mon, Nov 24, 2014 at 08:30:15AM +0100, Thomas Petazzoni wrote:
 >>> mips | ruby-2.1.5 | NOK |
 >>> http://autobuild.buildroot.net/results/13cc762085bca1b7a8ddae015661624fe34311ca/

 >> Can't reproduce this one here. It seems to only fail on your build machines 
 >> (http://autobuild.buildroot.net/?reason=ruby-2.1.5). Can you take a look?

 > Yes, I've started a manual build of that defconfig on gcc16 and will
 > take a look when it fails.

.. and I can also not reproduce it. It must be related to a race
condition as it has only triggered 4 times since the ruby version was
bumped on the 13th.

I'll try a clean rebuild again.

-- 
Bye, Peter Korsgaard
