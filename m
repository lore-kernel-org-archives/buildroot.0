From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 12:30:53 +0100
Subject: [Buildroot] [PATCH 1/3] New top-level directory: system
In-Reply-To: <8cae188654e0346c6569a5045b515ec118c07f7d.1351967245.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Nov 2012 19:27:58 +0100")
References: <cover.1351967245.git.thomas.petazzoni@free-electrons.com>
 <cover.1351967245.git.thomas.petazzoni@free-electrons.com>
 <8cae188654e0346c6569a5045b515ec118c07f7d.1351967245.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r4o9r4eq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This directory groups the following elements:
 Thomas>  * the default root filesystem skeleton
 Thomas>  * the default device tables
 Thomas>  * the Config.in options for system configuration (UART port for
 Thomas>    getty, system hostname, etc.)
 Thomas>  * the make rules to apply the system configuration options

 Thomas> Even though the skeleton and device tables could have lived in fs/, it
 Thomas> would have been strange to have the UART, system hostname and other
 Thomas> related options into fs/. A new system/ directory makes more sense.

 Thomas> As a consequence, this patch also removes target/Makefile.in, which
 Thomas> has become useless in the process.

Committed, thanks.

-- 
Bye, Peter Korsgaard
