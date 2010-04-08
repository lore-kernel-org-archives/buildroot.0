From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Apr 2010 10:23:18 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	codesourcery-toolchain-support
In-Reply-To: <cover.1270502861.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 5 Apr 2010 23:27:57 +0200")
References: <cover.1270502861.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87bpdupd3d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The following changes since commit 6cdcc4d7d8134f4b60f0eb9039090f9ad4c38366:
 Thomas>   Peter Korsgaard (1):
 Thomas>         gcc: hide shared libgcc option if BR2_PREFER_STATIC_LIB is enabled

 Thomas> are available in the git repository at:

 Thomas>   git://git.busybox.net/~tpetazzoni/git/buildroot codesourcery-toolchain-support

Looks good, but:

From git://git.busybox.net/~tpetazzoni/git/buildroot
 * branch            codesourcery-toolchain-support -> FETCH_HEAD
Auto-merging toolchain/external-toolchain/ext-tool.mk
CONFLICT (content): Merge conflict in toolchain/external-toolchain/ext-tool.mk
Automatic merge failed; fix conflicts and then commit the result.

Could you rebase please?

-- 
Bye, Peter Korsgaard
