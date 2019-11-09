From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Nov 2019 14:30:00 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-11-06
In-Reply-To: <569eeff2-f02f-3506-5cdc-1f02a8e3c325@gmail.com>
References: <5dc3c4b8.1c69fb81.ff4f2.2a4cSMTPIN_ADDED_MISSING@mx.google.com>
 <6d4b57b9-90c8-c2ba-9703-0a456b2dec9f@gmail.com>
 <20191109120151.GO3419@scaer>
 <569eeff2-f02f-3506-5cdc-1f02a8e3c325@gmail.com>
Message-ID: <20191109143000.37b5a746@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 9 Nov 2019 14:09:50 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Well, It's the same problem as for using llvm/clang on the host to build some
> host tools. For your case you have to build hos-llvm with your host variant
> (x86_64 for example) (LLVM_TARGETS_TO_BUILD).
> 
> But since we use the same LLVM_TARGET_ARCH for the host-llvm and llvm, we need
> to use -target x86_64-linux-gnu when using clang.

Wouldn't it be more "natural" for clang to by default produce binaries
for the host, and when you want to cross-compile, have to explicitly
pass -target arm-something-something ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
