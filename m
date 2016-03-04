From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Mar 2016 17:07:35 +0100
Subject: [Buildroot] [PATCH] glibc: backport patch to fix Microblaze
	build issue
In-Reply-To: <1457086510-32279-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 4 Mar 2016 11:15:10 +0100")
References: <1457086510-32279-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fuw66xbs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit backports a glibc patch that fixes the build of glibc 2.22
 > on the Microblaze architecture.

 > Fixes:

 >   http://autobuild.buildroot.org/results/673/67348953fac469affd1965e04d61485ebb41e252/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
