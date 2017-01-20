From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 21:19:42 +0100
Subject: [Buildroot] [PATCH] poco: avoid build failures on multicore
	hosts
In-Reply-To: <1484936334-19116-1-git-send-email-casantos@datacom.ind.br>
 (Carlos Santos's message of "Fri, 20 Jan 2017 16:18:54 -0200")
References: <1484936334-19116-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <87wpdpqyap.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Parallel build still fails on heavilly multicore machines (e.g. -j25)
 > and hacks likecommit 32f4957b153bdabe7af60d529942aca7d1a4783d do not
 > seem to be effective.

 > Let's simply use MAKE1 for the build step, instead.

 > Fixes:
 > http://autobuild.buildroot.net/results/388/38834ad3013fe79e5e4f75997133f1bd827be6dc

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

 > ---
 > Extra information: here at DATACOM we have a build farm with several
 > multicore blades that usually build with "make -j25". With this setup we
 > have been observing compilation failures each two days.

 > Change-Id: If80cd0b01ceb8b0aee886ea96a266fa864fa8eb0

Committed, thanks.

-- 
Bye, Peter Korsgaard
