From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jun 2020 15:08:48 +0200
Subject: [Buildroot] [PATCH] package/checkpolicy: fix -fno-common build
 failure
In-Reply-To: <20200506122101.48925-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Wed, 6 May 2020 07:21:01 -0500")
References: <20200506122101.48925-1-matthew.weber@rockwellcollins.com>
Message-ID: <87sgf79g67.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Added upstream patch for removal of unused te_assertions which was
 > found when using GCC10 as a host complier (-fno-common is now default)

 > Fixes:
 > http://autobuild.buildroot.net/results/63f2d1897a8f581ec107374bf2cbb68d3add4109/

 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Cc: Adam Duskett <aduskett@gmail.com>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---

 > Romain, would you mind testing this one on your GCC10 builder?

 > Peter I'm tested that this can be cherry-picked back to 2020.02.x without any issue.
 > I haven't see a build failure yet on that branch but we should.

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
