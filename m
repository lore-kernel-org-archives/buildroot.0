From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 01:15:16 +0100
Subject: [Buildroot] [PATCH 04/18] Rename BR2_INET_RPC to
	BR2_TOOLCHAIN_HAS_NATIVE_RPC
In-Reply-To: <df263474cae4ecb6cf8100906a8093bf2dab2c29.1351964808.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Nov 2012 18:47:49 +0100")
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <df263474cae4ecb6cf8100906a8093bf2dab2c29.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vcdmustn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The BR2_INET_RPC has for a long time been a not very descriptive
 Thomas> configuration option name, and with the advent of non-RPC glibc
 Thomas> toolchains and the apparition of libtirpc, we really need to rename it
 Thomas> to something more sensible, BR2_TOOLCHAIN_HAS_NATIVE_RPC.

Committed, thanks.
 
-- 
Bye, Peter Korsgaard
