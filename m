From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Feb 2012 10:48:56 +0100
Subject: [Buildroot] [git commit] uClibc: rename 0.9.33 syscall_ncs patch
Message-ID: <20120227155010.8273790BA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4280c150393d03350d94f7d7457aad6fb9bc49de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No need for double dashes - Purely cosmetical.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ..._err-and-pass-it-to-INTERNAL_SYSCALL_NCS.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.33--Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS.patch b/toolchain/uClibc/uClibc-0.9.33-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.33--Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS.patch
rename to toolchain/uClibc/uClibc-0.9.33-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS.patch
