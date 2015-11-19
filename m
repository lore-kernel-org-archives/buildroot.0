From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 22:52:32 +0100
Subject: [Buildroot] [PATCH] iproute2: fix build with musl
In-Reply-To: <1447967220-30052-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 19 Nov 2015 22:07:00 +0100")
References: <1447967220-30052-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871tbl8xnj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds two patches to the iproute2 package that are
 > necessary to build it against the musl C library. Both patches have
 > been submitted upstream.

 > Fixes:

 >   http://autobuild.buildroot.org/results/5d3/5d3f8c2242e9a89bb545166fc7d70429d2cddd42/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I just started looking at that build failure as well - Committed, thanks.

-- 
Bye, Peter Korsgaard
