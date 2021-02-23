From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2021 13:48:46 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/go: bump version to 1.16
In-Reply-To: <20210220005039.3200227-1-christian@paral.in> (Christian
 Stewart's message of "Fri, 19 Feb 2021 16:50:39 -0800")
References: <20210220005039.3200227-1-christian@paral.in>
Message-ID: <87a6rvne4x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Release notes: https://golang.org/doc/go1.16
 > The latest Go release, version 1.16, arrives six months after Go 1.15. Most of
 > its changes are in the implementation of the toolchain, runtime, and libraries.

 > The linker changes in 1.16 extend the 1.15 improvements to all supported
 > architecture/OS combinations (the 1.15 performance improvements were primarily
 > focused on ELF-based OSes and amd64 architectures). For a representative set of
 > large Go programs, linking is 20-25% faster than 1.15 and requires 5-15% less
 > memory on average for linux/amd64, with larger improvements for other
 > architectures and OSes. Most binaries are also smaller as a result of more
 > aggressive symbol pruning.

 > Go 1.15 release notes, Go 1.16 drops support for x87 mode

This was presumably supposed to be 1.16?

 > compilation (GO386=387). Support for non-SSE2 processors is now available using
 > soft float mode. Buildroot will automatically set GO386=softfloat on non-SSE2
 > processors.

 > Signed-off-by: Christian Stewart <christian@paral.in>

 > v1 -> v2:

 >  - added 386=softfloat handling re: Peter's review

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
