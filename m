From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 May 2010 12:20:38 +0200
Subject: [Buildroot] Build fails aound host-mtd-1.3.1
In-Reply-To: <000001cafca3$627b5880$27720980$@com> (Barry Bridges's message of
	"Wed, 26 May 2010 08:16:39 +0100")
References: <000001cafca3$627b5880$27720980$@com>
Message-ID: <87wrurnevd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Barry" == Barry Bridges <barry@disignconsultants.com> writes:

 Barry> Hi all,
 Barry> I have a build error towards the end of the build process, not 100% sure where
 Barry> the failure lies but the error and few preceding lines are below with my
 Barry> .config.  If I type make again it finishes the build, but I?m not sure if the
 Barry> build is correct or complete.

You didn't post enough to show the error, but it's probably the parallel
build issue with ubi we recently (post-rc2) fixed in mtd-utils. I'll put
out rc3 later today or tomorrow, could you in the mean time give the
latest nightly snapshot a try instead?

-- 
Bye, Peter Korsgaard
