From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 6 Nov 2018 22:00:57 +0100
Subject: [Buildroot] Clang and SDK relocation
In-Reply-To: <CANQCQpZ41eFDSffOMmpGEOSTDzZhDp92fffHrSZTVJX4P2n0cA@mail.gmail.com>
References: <CANQCQpZ41eFDSffOMmpGEOSTDzZhDp92fffHrSZTVJX4P2n0cA@mail.gmail.com>
Message-ID: <e906588a-3b7d-7b65-25cd-595b79fa8588@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 06/11/2018 ? 19:24, Matthew Weber a ?crit?:
> While working on a patchset for adding the compiler-rt sanitizers.  We
> noticed an issue if we moved the build as an SDK (path changed on
> system so that the orig build doesn't exist).  The include search
> paths provided to Clang seem to be ignored (sysroot/-I).  These
> options do work if using the tools from the original build location.
> Do you guys happen to know of any options I could start investigating
> to adjust to make a relative path or prefix with sysroot fix in the
> Clang build?

AFAIK, we didn't test to relocate the SDK with LLVM/Clang.
It's also a problem if we want to include LLVM/Clang as an external toolchain.

> 
> I'll keep looking through the code and see what I can find.

Ok thanks!

Best regards,
Romain

> 
> Thanks!
> Matt
> 
