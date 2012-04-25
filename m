From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Apr 2012 09:47:35 +0200
Subject: [Buildroot] [PATCH 19/22] toolchain: remove
	toolchain/Makefile.in and toolchain/gcc/Makefile.in
In-Reply-To: <6e213ba2e15b59d8baedfa3b7a7e643b2957ac24.1334673910.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 Apr 2012 16:45:31 +0200")
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <6e213ba2e15b59d8baedfa3b7a7e643b2957ac24.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87397sdzhk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Re-integrate in gcc-uclibc-4.x.mk things from
 Thomas> toolchain/gcc/Makefile.in that were completely gcc-specific. There was
 Thomas> no reason to pull that when building with other backends than the
 Thomas> internal one.

Committed, thanks.

-- 
Bye, Peter Korsgaard
