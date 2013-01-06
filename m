From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 17:44:00 +0100
Subject: [Buildroot] [PATCH] gstreamer: provide necessary config value
	for AArch64
In-Reply-To: <1357488842-22491-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 17:14:02 +0100")
References: <1357488842-22491-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878v86gt2n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Provide the as_cv_unaligned_access value for the AArch64 architecture.
 Thomas> Fixes:

 Thomas>   http://autobuild.buildroot.net/results/5d6d76451a00d79e1bdfe87b6ced61807666cc48/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
