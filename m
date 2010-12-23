From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Dec 2010 11:13:49 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: add missing stamp file touch
	in external toolchain
In-Reply-To: <7f7c793bd9f7ee4b0745b35c9106cf16be717172.1293096662.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Thu, 23 Dec 2010 10:31:08 +0100")
References: <cover.1293096662.git.thomas.petazzoni@free-electrons.com>
	<cover.1293096662.git.thomas.petazzoni@free-electrons.com>
	<7f7c793bd9f7ee4b0745b35c9106cf16be717172.1293096662.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ipyksso2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In the support of custom external toolchains, we forgot to touch the
 Thomas> $(STAMP_DIR)/ext-toolchain-checked stamp file, which means that the
 Thomas> toolchain was re-checked and re-installed at everyt build.

Committed, thanks.

-- 
Bye, Peter Korsgaard
