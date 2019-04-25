From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 25 Apr 2019 08:35:16 -0400
Subject: [Buildroot] Installing kernel headers after building Linux
Message-ID: <EAEE4C8D-B3C1-4310-8D48-24B29A066A97@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have a setup where I?m using a non-Buildroot external toolchain, and I'm trying to add a package that requires the kernel headers from the same version of Linux that?s running. The kernel headers in the external toolchain don?t match the version of Linux that I?m using as you?d expect.

I?m wondering why the Linux build step doesn?t run `make headers_install` at the end so that the header files could be available. Would doing this for external toolchains cause an issue? Before I head too far down that path, I wanted to check.

Or is there another way of making the kernel headers available (aside from switching to an internally generated toolchain)? In case it matters, the package I?m looking at adding is `ply` so that I can run a couple eBPF traces.

Thanks!
Frank
