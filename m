From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Mar 2014 07:29:09 +0100
Subject: [Buildroot] [PATCH 0/4] Update the AArch64 defconfig for
	Foundation v8
In-Reply-To: <1395376446-29367-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 21 Mar 2014 05:34:02 +0100")
References: <1395376446-29367-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87txasuksq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > This set of commits updates the Foundation v8 defconfig to use a
 > mainline kernel, bumps the version of the boot-wrapper-aarch64, and
 > fixes a problem with the Linaro AArch64 toolchain (which was initially
 > reported by Kevin Hilman on IRC).

Committed series, thanks - Great we got to the bottom of the issue.

-- 
Bye, Peter Korsgaard
