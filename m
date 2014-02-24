From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Feb 2014 09:03:52 +0100
Subject: [Buildroot] [PATCH 0/7] Misc set of fixes
In-Reply-To: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 23 Feb 2014 23:58:04 +0100")
References: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sir9lyxj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > The first three patches are fixes for build failures. The last four
 > patches are fixes for missing dependency propagation of BR2_USE_MMU.

 > Thomas

 > Thomas Petazzoni (7):
 >   cairo: fix build on Blackfin in test/cairo-test-runner.c
 >   cairo: improve the Blackfin build fix
 >   util-linux: libblkid needs fork(), disable on !MMU
 >   opencv: add missing dependency on !MMU for gtk support
 >   packages: missing propagation of !mmu from pango
 >   pcmanfm: add missing BR2_USE_MMU dependency from gamin
 >   sconeserver: missing dependency on BR2_USE_MMU

Committed series, thanks.

-- 
Bye, Peter Korsgaard
