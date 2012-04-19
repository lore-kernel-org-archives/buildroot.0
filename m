From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Apr 2012 00:01:30 +0200
Subject: [Buildroot] [PATCH 11/22] cmake: move creation of toolchain
	file to package/pkg-cmaketargets.mk
In-Reply-To: <ce2f3da881c44f0e66adbb628307413f8bba8058.1334673910.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 Apr 2012 16:45:23 +0200")
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <ce2f3da881c44f0e66adbb628307413f8bba8058.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vckvidol.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This also requires moving a few include directives below the "all:"
 Thomas> target in the main Makefile, otherwise the new target to create the
 Thomas> toolchain file in pkg-cmaketargets.mk gets used as the default make
 Thomas> target instead of "all:".

Committed, thanks.

-- 
Bye, Peter Korsgaard
