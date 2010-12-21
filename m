From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 21 Dec 2010 13:57:28 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: fix multilib symlink for
	external toolchains
In-Reply-To: <d266d70afb300c8cda477b046863c88f6f16942e.1292935765.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 21 Dec 2010 13:49:37 +0100")
References: <cover.1292935765.git.thomas.petazzoni@free-electrons.com>
	<cover.1292935765.git.thomas.petazzoni@free-electrons.com>
	<d266d70afb300c8cda477b046863c88f6f16942e.1292935765.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87y67juvuv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> ARCH_SUBDIR is a shell variable, so it should be referenced with
 Thomas> $${ARCH_SUBDIR}. Without this, no symbolic link is created, and the
 Thomas> external toolchain fails to work if the non-default multilib variant
 Thomas> is used.

Committed, thanks.

-- 
Bye, Peter Korsgaard
