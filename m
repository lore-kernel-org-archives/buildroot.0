From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Apr 2019 20:18:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: Fix build caused
 by extra 'install' target
In-Reply-To: <1554215038-2515-1-git-send-email-email@gmail.com> (Vadim
 Kochan's message of "Tue, 2 Apr 2019 17:23:58 +0300")
References: <1554215038-2515-1-git-send-email-email@gmail.com>
Message-ID: <87k1gcgtiu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vadim" == Vadim Kochan <vadim4j@gmail.com> writes:

 > From: Vadim Kochan <vadim4j@gmail.com>
 > After commit:

 > 	b0f98d5 package/netsniff-ng: allow to build with uclibc but w/o mausezahn

 > the different build and install targets are specified depending if
 > masuezahn tool is able to be selected or not. It works for the build
 > case but for the install the old 'install' target was not removed from
 > the make invocation and it still forces to install the mausezahn, so fix
 > it by remove this target.

 > Fixes:
 > 	http://autobuild.buildroot.net/results/cc44ed737799c9ac73628c82b86bd526b1c43310/
 > 	http://autobuild.buildroot.net/results/72d0753532720604d51c05663af7fbfe37434339/

 > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
