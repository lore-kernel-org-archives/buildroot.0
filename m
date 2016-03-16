From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Mar 2016 23:23:04 +0100
Subject: [Buildroot] [PATCH 3/4] libcap, cdrkit, dvdrw-tools, fastd,
	squid: remove headers >= 3.0 dependency
In-Reply-To: <1458159611-5613-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 16 Mar 2016 21:20:10 +0100")
References: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458159611-5613-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y49i6p13.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Now that the libcap package has a patch that makes it build with
 > kernel headers < 3.0 (which was needed for the host variant of
 > libcap), there is no longer a need to have a dependency on headers >=
 > 3.0 for the target variant of libcap.

 > All reverse dependencies of libcap are handled in this commit, except
 > lxc, which will be handled in a separate commit since it needs some
 > special solution.

 > The build of all those packages has been tested with a toolchain that
 > uses kernel headers 2.6.32, which is the oldest that our default glibc
 > version accepts to use.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
