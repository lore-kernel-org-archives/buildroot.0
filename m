From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Jul 2013 22:30:44 +0200
Subject: [Buildroot] [PATCHv2 03/25] arch/arm: remove OABI option
In-Reply-To: <1373754468-7527-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 14 Jul 2013 00:27:26 +0200")
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373754468-7527-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878v18dguj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Thomas> OABI is more than legacy, it's dead.

 Thomas> New developments should go with EABI, since it so much better.
 >> From the Debian EABI page [0] :
 Thomas>   - floating point performance, with or without an FPU is very much faster
 Thomas>   - mixing soft and hardfloat code is possible
 Thomas>   - structure packing is not as painful as it used to be
 Thomas>   - a more efficient syscall convention
 Thomas>   - more compatibility with various tools

 Thomas> [0] http://wiki.debian.org/ArmEabiPort

Committed, thanks.

-- 
Bye, Peter Korsgaard
