From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2016 11:03:12 +0100
Subject: [Buildroot] [PATCH] package,
	toolchain: remove BR2_TOOLCHAIN_HAS_GCC_BUG_* options
In-Reply-To: <1454109890-19470-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 30 Jan 2016 00:24:50 +0100")
References: <1454109890-19470-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y4b7l6zj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Quite some time ago, we added the options
 > BR2_TOOLCHAIN_HAS_GCC_BUG_58595 and BR2_TOOLCHAIN_HAS_GCC_BUG_58854 to
 > indicate if the toolchain was affected by those gcc bugs, which were
 > causing build failure with a number of packages.

 > With the recent change in the external toolchain logic to provide only
 > the latest version of each toolchain "family", all the toolchains
 > which were affected by those issues disappeared from Buildroot. Those
 > options are no longer being selected anywhere, and being blind
 > options, it means their value is always going to be "disabled".

 > Conquently, this commit removes those options completely, and updates
 > all the packages where they were used.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
