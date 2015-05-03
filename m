From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 May 2015 19:33:56 +0200
Subject: [Buildroot] [PATCH 1/2] libfreeimage: add patch to fix x86
	build problem
In-Reply-To: <1430656670-919-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 May 2015 14:37:49 +0200")
References: <1430656670-919-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fv7dsgzf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Add a patch to fix an x86 build problem caused by invalid register
 > usage when -fPIC is used.

 > Fixes:

 >   http://autobuild.buildroot.org/results/fe7/fe72243a84a91b68ef3138847294674b36f16c58/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
