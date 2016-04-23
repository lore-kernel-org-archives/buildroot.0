From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Apr 2016 11:38:09 +0200
Subject: [Buildroot] [PATCH] shared-mime-info: add patch to fix parallel
	installation issue
In-Reply-To: <1461361870-26776-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 22 Apr 2016 23:51:10 +0200")
References: <1461361870-26776-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r3dwr7ge.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch that should fix the parallel installation. A
 > similar patch is used by the Yocto Project, and they have already
 > submitted it upstream.

 > Fixes:

 >   http://autobuild.buildroot.org/results/bb29c8fa5c44eaa575ff641958cba4736d9b2538/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
