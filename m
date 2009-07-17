From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Jul 2009 22:53:57 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	external-toolchain
In-Reply-To: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri\,
	17 Jul 2009 10\:35\:27 +0200")
References: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87k527hvyy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The following changes since commit ea536503331aea875e84ae598b4610fbd059f167:
 Thomas>   Peter Korsgaard (1):
 Thomas>         ruby: needs WCHAR support in toolchain

 Thomas> are available in the git repository at:

 Thomas>   git://git.busybox.net/~tpetazzoni/git/buildroot external-toolchain

 Thomas> Thomas Petazzoni (8):
 Thomas>       external toolchain: fix libraries copy and add ARM ABI check
 Thomas>       external-toolchain: better documentation, cleanup, sysroot check
 Thomas>       external toolchain: use LANG=C when calling gcc -v
 Thomas>       external toolchain: more documentation about the principles
 Thomas>       external toolchain: do not copy useless symbolic links
 Thomas>       external toolchain: copy the C++ standard library if needed
 Thomas>       external toolchain: respect $(Q)
 Thomas>       external toolchain: check cross-compiler existence

Pulled and pushed - Thanks!

-- 
Bye, Peter Korsgaard
