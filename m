From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 09:19:25 +0200
Subject: [Buildroot] [PATCH] pugixml: new package
In-Reply-To: <20160911215627.fuqvlcqo4rh67uc3@skynet.be>
References: <20160904210846.1332-1-theo.debrouwere@skynet.be>
 <1473262627-14429-1-git-send-email-theo.debrouwere@skynet.be>
 <1473262627-14429-2-git-send-email-theo.debrouwere@skynet.be>
 <20160911230830.0bc783a5@free-electrons.com>
 <20160911215627.fuqvlcqo4rh67uc3@skynet.be>
Message-ID: <20160912091925.36c6f94d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for having looked into this!

On Sun, 11 Sep 2016 23:56:27 +0200, Theo Debrouwere wrote:

> The bfin issues seems to be caused by a fault in the CMakelist.txt file.
> Which seems to have been solved in the upstream git repo.
> I will test the fix & verify that it solves the issue.
> 
> If it does, I'll provide the fix as a patch on 1.7, unless you/someone
> else prefers bumping to an unreleased git commit.

The fix as a patch on 1.7 is probably the best solution for now, until
upstream makes a new release that includes the fix.

> The arc issue: the compiler complains about an internal error.
> I'm not sure if this is a pugimxl issue, but I'll reproduce it
> tomorrow. (currently building bfin)

The ARC issue is indeed a compiler problem, which is not directly
related to pugixml. The people taking care of the ARC architecture have
been notified of this build failure, and they regularly provide updates
to the ARC toolchain support in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
