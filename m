From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Apr 2013 11:51:34 +0200
Subject: [Buildroot] [PATCH 0/4] External toolchain updates
In-Reply-To: <1365357662-25960-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 7 Apr 2013 20:00:58 +0200")
References: <1365357662-25960-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877gkazpax.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here are some traditional toolchain updates (for Linaro ARM and
 Thomas> Aarch64 toolchains), a typo fix for a Blackfin toolchain, and the
 Thomas> removal of the oldest Microblaze toolchain, since it is no longer
 Thomas> possible to download just the toolchain tarball from the Git
 Thomas> repository.

 Thomas> Thanks.

 Thomas> Thomas Petazzoni (4):
 Thomas>   toolchain-external: update ARM Linaro toolchains
 Thomas>   toolchain-external: update AArch64 Linaro toolchains
 Thomas>   toolchain-external: fix typo in Blackfin toolchain config option

Committed these 3, thanks!

 Thomas>   toolchain-external: remove older Microblaze toolchain

I'm holding on to this for a little while longer until we figure out how
to solve the issues.

-- 
Bye, Peter Korsgaard
