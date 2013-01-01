From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jan 2013 22:21:03 +0100
Subject: [Buildroot] [PATCH 3/4] lttng-tools: bump to 2.1.0
In-Reply-To: <20121231181629.727e4aa7@skate> (Thomas Petazzoni's message of
 "Mon, 31 Dec 2012 18:16:29 +0100")
References: <cover.1356905589.git.s.martin49@gmail.com>
 <9454e547b508f2f70f9891c14b4fe409ca02e1f4.1356905589.git.s.martin49@gmail.com>
 <20121231181629.727e4aa7@skate>
Message-ID: <87bod8sips.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Samuel Martin,
 Thomas> On Sun, 30 Dec 2012 23:17:46 +0100, Samuel Martin wrote:

 >> +# Since the 2.1.0 release, lttng-tools depends on flex and bison,
 >> +# but they are not added to the dependency list since they are
 >> +# already Buildroot dependencies.

 Thomas> We are not very clear about this: we have packages for host-flex and
 Thomas> host-bison, and they are actually used by some of our packages. But we
 Thomas> also require the user to have flex and bison installed in his
 Thomas> distribution.

 Thomas> Probably something that should be clarified, in one direction or
 Thomas> another.

Yes, it would be good to get rid of the flex/bison deps, and use our own
everywhere if possible.

-- 
Bye, Peter Korsgaard
