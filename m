From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jun 2010 16:58:33 +0200
Subject: [Buildroot] [PATCH 49/49] linux: fix dependency on mkimage
In-Reply-To: <20100613155141.7d32f971@surf> (Thomas Petazzoni's message of
	"Sun, 13 Jun 2010 15:51:41 +0200")
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
	<8e73aeb69e20635f7e7832e6694967adb3cb58eb.1276352309.git.thomas.petazzoni@free-electrons.com>
	<20100613155141.7d32f971@surf>
Message-ID: <87fx0rf086.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Sat, 12 Jun 2010 16:22:23 +0200
 Thomas> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

 >> -LINUX26_MKIMAGE_DIR:=$(BUILD_DIR)/u-boot-tools

 Thomas> I've pushed a modified version of this commit that gets rid of
 Thomas> LINUX26_MKIMAGE_DIR. This was a comment from Peter that I forgot to fix
 Thomas> before reposting the big patchset.

Ok, thanks.

 Thomas> Unless explictly asked to do so, I will not resend the full set of
 Thomas> patches just for this change.

Fine.

I'll pull tonight and test.

-- 
Bye, Peter Korsgaard
