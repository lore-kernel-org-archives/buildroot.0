From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 23:52:11 +0200
Subject: [Buildroot] [git commit] configs/qemu_*: unbreak after version bump
Message-ID: <20131004215424.73E519B940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d7fb2e350cc6e3d2a5f72278b2f488ca8599189
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 2c859079cd (configs/qemu: bump relevant config version) renamed
a number of linux configuration files, but forgot to update the defconfigs.

Tests shows that atleast arm versatile doesn't boot with 3.11, so rename
the linux configuration files back rather than adjusting the defconfigs.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.11.config => linux-3.10.config}       |    0
 .../{linux-3.11.config => linux-3.10.config}       |    0
 .../{linux-3.11.config => linux-3.10.config}       |    0
 .../{linux-3.11.config => linux-3.10.config}       |    0
 .../{linux-3.11.config => linux-3.10.config}       |    0
 .../{linux-3.11.config => linux-3.10.config}       |    0
 .../x86/{linux-3.11.config => linux-3.10.config}   |    0
 .../{linux-3.11.config => linux-3.10.config}       |    0
 8 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/board/qemu/arm-versatile/linux-3.11.config b/board/qemu/arm-versatile/linux-3.10.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.11.config
rename to board/qemu/arm-versatile/linux-3.10.config
diff --git a/board/qemu/microblazebe-mmu/linux-3.11.config b/board/qemu/microblazebe-mmu/linux-3.10.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-3.11.config
rename to board/qemu/microblazebe-mmu/linux-3.10.config
diff --git a/board/qemu/microblazeel-mmu/linux-3.11.config b/board/qemu/microblazeel-mmu/linux-3.10.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-3.11.config
rename to board/qemu/microblazeel-mmu/linux-3.10.config
diff --git a/board/qemu/mips-malta/linux-3.11.config b/board/qemu/mips-malta/linux-3.10.config
similarity index 100%
rename from board/qemu/mips-malta/linux-3.11.config
rename to board/qemu/mips-malta/linux-3.10.config
diff --git a/board/qemu/mipsel-malta/linux-3.11.config b/board/qemu/mipsel-malta/linux-3.10.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-3.11.config
rename to board/qemu/mipsel-malta/linux-3.10.config
diff --git a/board/qemu/powerpc-g3beige/linux-3.11.config b/board/qemu/powerpc-g3beige/linux-3.10.config
similarity index 100%
rename from board/qemu/powerpc-g3beige/linux-3.11.config
rename to board/qemu/powerpc-g3beige/linux-3.10.config
diff --git a/board/qemu/x86/linux-3.11.config b/board/qemu/x86/linux-3.10.config
similarity index 100%
rename from board/qemu/x86/linux-3.11.config
rename to board/qemu/x86/linux-3.10.config
diff --git a/board/qemu/x86_64/linux-3.11.config b/board/qemu/x86_64/linux-3.10.config
similarity index 100%
rename from board/qemu/x86_64/linux-3.11.config
rename to board/qemu/x86_64/linux-3.10.config
