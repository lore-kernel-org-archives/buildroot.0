From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 12:58:05 +0200
Subject: [Buildroot] [PATCH] sunxi-cedarx: bump version,
	improve EABI support
In-Reply-To: <1413110824-9528-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 12 Oct 2014 12:47:04 +0200")
References: <1413110824-9528-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87iojpzhaa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Spenser Gilliland <spenser@gillilanding.com>
 > This commit bumps the sunxi-cedarx package version to the latest git
 > commit, which also provides a better support for ARM EABI, since it
 > now has a non-EABIhf variant of avheap.so available.

 > Built tested on ARM EABI and ARM EABIhf.

 > [Thomas: compared to Spenser's original version, bumped to a newer
 > version, and dropped the supported for the demo since it didn't build,
 > and fixing it isn't trivial.]

s/the supported/support/.

Committed, thanks.

-- 
Bye, Peter Korsgaard
