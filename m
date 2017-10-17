From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:07:02 +0200
Subject: [Buildroot] [git commit] musl: add patch to fix build on ARMv4
	with new binutils
In-Reply-To: <20171008135235.27D658114E@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 8 Oct 2017 15:59:34 +0200")
References: <20171008135235.27D658114E@busybox.osuosl.org>
Message-ID: <87sheii1mx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=27cf2d3baf879f7314f12787982d8f4a5b4218cf
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > New binutils (since 2.27.51) cannot build musl-1.1.16 due to breakage in ARMv4
 > atomics asm.  This patch from upstream musl repository is needed until
 > musl-1.1.17 is released:
 > https://git.musl-libc.org/cgit/musl/commit/?id=b261a24256792177a5f0531dbb25cc6267220ca5

 > Signed-off-by: Timothy Lee <timothy.ty.lee@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
