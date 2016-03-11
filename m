From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Mar 2016 15:21:24 +0100
Subject: [Buildroot] Autobuilder update
In-Reply-To: <20160311143725.6b8ede6f@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 11 Mar 2016 14:37:25 +0100")
References: <20160310234742.3df6dff2@free-electrons.com>
 <8760wtjmqq.fsf@dell.be.48ers.dk>
 <20160311143725.6b8ede6f@free-electrons.com>
Message-ID: <87fuvxhz8b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I recently also ran into these gmp/mpc/mpfr issues building a
 >> toolchain at work (for the glibc dns issue) and had to spend some
 >> time to debug and come up with a similar workaround as you did. I
 >> really think we should include that patch in buildroot until we get
 >> the $ORIGIN rpath stuff merged to save peoples time.

 > OK. So I'll submit such a patch.

Great!

 > I would also like to get a resolution for the toolchain wrapper usr/
 > issue. I proposed the patch in the thread I originally started, but got
 > no feedback so far (but I understand the issue is not the most pleasant
 > one to think about).

Yeah, I haven't had time to look at it yet. I'll try to find time this
weekend.

-- 
Venlig hilsen,
Peter Korsgaard 
