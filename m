From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Apr 2013 23:10:40 +0200
Subject: [Buildroot] [PATCHv4 0/4] gdb support improvements
In-Reply-To: <1365329076-19853-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 7 Apr 2013 12:04:32 +0200")
References: <1365329076-19853-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ehegsrhr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> This patch series makes a number of improvements to gdb handling.

 Thomas> The first patch converts gdb to the package infrastructure and has
 Thomas> already been sent to the list in two successive versions.

 Thomas> The second patch implements a suggestion from Yann E. Morin that we
 Thomas> should allow to build gdbserver/cross-gdb if the external toolchain
 Thomas> gdbserver is copied to the target. The idea is that if the user
 Thomas> chooses to copy the external toolchain gdbserver to the target, then
 Thomas> (s)he should be using the cross-gdb of the external toolchain in order
 Thomas> to avoid any incompatibility.

 Thomas> The third patch makes sure that we install the gdbserver binary
 Thomas> somewhere in the SDK, so that the Buildroot toolchain can later be
 Thomas> used as an external toolchain. It replaces the patch proposed by Kevin
 Thomas> Worth at http://patchwork.ozlabs.org/patch/229438/.

 Thomas> The fourth patch is a patch I had already sent some time ago, but
 Thomas> which was lost. It ensures the external toolchain logic finds
 Thomas> gdbserver for certain Sourcery CodeBench toolchains.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
