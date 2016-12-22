From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Dec 2016 08:44:52 +0100
Subject: [Buildroot] [PATCH] lzlib: depends on lua
In-Reply-To: <20161221234842.649a8277@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 21 Dec 2016 23:48:42 +0100")
References: <20161221202244.7197-1-gustavo.zacarias@free-electrons.com>
 <20161221234842.649a8277@free-electrons.com>
Message-ID: <87wpes1k7f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 21 Dec 2016 17:22:44 -0300, gustavo.zacarias at free-electrons.com
 > wrote:
 >> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 >> 
 >> It's missing the dependency on lua, hence when using the upcoming PPS
 >> support its staging directory isn't populated with the required
 >> dependencies resulting in build failure.
 >> 
 >> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

 > I'm probably missing something, but even without PPS we should have
 > seen build failures of this package, no?

 > Or because lzlib is after lua in alphabetic ordering, and nothing makes
 > lzlib built before lua due to dependencies, we were lucky enough?

Yes, I think it purely worked by chance because of the alphabetical
ordering.

-- 
Bye, Peter Korsgaard
