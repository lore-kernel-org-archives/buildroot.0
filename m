From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Apr 2012 08:56:44 +0200
Subject: [Buildroot] [PATCH 14/22] toolchain: remove useless indirect
	variables
In-Reply-To: <1488a586916d42731cac7ebb53dc6aff5dd35643.1334673910.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 Apr 2012 16:45:26 +0200")
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <1488a586916d42731cac7ebb53dc6aff5dd35643.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vckoe1ub.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The BR2_CONFIGURE_DEVEL_SYSROOT, BR2_CONFIGURE_STAGING_SYSROOT and
 Thomas> BR2_CONFIGURE_BUILD_TOOLS were used only in a few places, and it is in
 Thomas> fact clearer to just use their value in the various places they are
 Thomas> used.

Committed, thanks.

-- 
Bye, Peter Korsgaard
