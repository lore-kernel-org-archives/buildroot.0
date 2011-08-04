From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Aug 2011 21:01:05 +0200
Subject: [Buildroot] [PATCH 1/1] external toolchains: fix SuperH
	toolchain configuration
In-Reply-To: <8b3041e165e35a881d948ad262b919c973f8a549.1311976829.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 30 Jul 2011 00:00:37 +0200")
References: <cover.1311976829.git.thomas.petazzoni@free-electrons.com>
 <cover.1311976829.git.thomas.petazzoni@free-electrons.com>
 <8b3041e165e35a881d948ad262b919c973f8a549.1311976829.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871ux1ovbi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The CodeSourcery toolchain for SH2-A platforms provide largefile
 Thomas> support, inet RPC, wide char and threads, so adjust the configuration
 Thomas> accordingly.

Committed, thanks.

-- 
Bye, Peter Korsgaard
