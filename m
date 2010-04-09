From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Apr 2010 11:20:37 +0200
Subject: [Buildroot] [pull request] Pull request for branch fs-cleanup
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri, 9 Apr 2010 11:06:38 +0200")
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8739z5kmmy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> This patchset implements a major rework of the code that
 Thomas> generates the root filesystem generation. It is part of a more
 Thomas> general work that aims at cleaning up the contents of the
 Thomas> target/ directory.

 Thomas> Each patch has a description detailing its changes but here is
 Thomas> the list of the major steps that this patch set goes through :

Looks very good, thanks!

 Thomas>    - New squashfs package, supported for both target and host
 Thomas>      note that I removed support for SquashFS 3.x

The squashfs 4.0 filesystem exists for 1 year now, so it's quite new
(and tied to kernel versions) - Aren't we leaving people with older
kernels out in the cold?

Maybe now is the time to get rid of the old version, I don't know - But
3.4 was not marked as deprecated (only recent) in 2010.02.

-- 
Bye, Peter Korsgaard
