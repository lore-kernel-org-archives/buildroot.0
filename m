From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Dec 2009 10:47:39 +0100
Subject: [Buildroot] [git commit master] toolchain/uClibc: avr32 patch
	should apply to 0.9.30.1
Message-ID: <20091215094823.63E5D777F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=687d0958a31f6aee8e8e4d26360961327049d9a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

avr32 uses 0.9.30.1, not 0.9.30.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ....30.1-fix-varargs-in-prctl-syscall.patch.avr32} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename toolchain/uClibc/{uClibc-0.9.30-fix-varargs-in-prctl-syscall.patch.avr32 => uClibc-0.9.30.1-fix-varargs-in-prctl-syscall.patch.avr32} (100%)

diff --git a/toolchain/uClibc/uClibc-0.9.30-fix-varargs-in-prctl-syscall.patch.avr32 b/toolchain/uClibc/uClibc-0.9.30.1-fix-varargs-in-prctl-syscall.patch.avr32
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.30-fix-varargs-in-prctl-syscall.patch.avr32
rename to toolchain/uClibc/uClibc-0.9.30.1-fix-varargs-in-prctl-syscall.patch.avr32
-- 
1.6.3.3
