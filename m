From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Apr 2013 20:13:51 +0200
Subject: [Buildroot] [PATCH 2/2] gdb: disable on AArch64
In-Reply-To: <1365862152-24325-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 13 Apr 2013 16:09:11 +0200")
References: <1365862152-24325-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365862152-24325-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwt2pacg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The mainline gdb does not yet have AArch64 support at all, so let's
 Thomas> disable it for this platform. The external toolchain provided by
 Thomas> Linaro has gdbserver + cross-gdb, so it already provides what's
 Thomas> necessary to do some debugging.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
