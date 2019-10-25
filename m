From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 18:37:50 +0200
Subject: [Buildroot] [PATCH] package/rng-tools: needs threads
In-Reply-To: <20191025083934.32234-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Fri, 25 Oct 2019 03:39:34 -0500")
References: <20191025083934.32234-1-matthew.weber@rockwellcollins.com>
Message-ID: <87y2x8ixwh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Since the bump to 6.7 there has been a new dependency on threads.
 > https://github.com/nhorman/rng-tools/commit/6952b8ae4736a9b8f58fd2ff330a423ea76cf515#diff-c949f93d03f44a4217d7a138f9e2e54a

 > Fixes:
 > http://autobuild.buildroot.net/results/fff63dd9a53eafe0234ad19f715f050527afedc8/

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
