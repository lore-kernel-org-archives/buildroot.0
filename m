From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 13:40:47 +0200
Subject: [Buildroot] [PATCH] package/binutils: add patches to fix
 OpenRisc bug 27624
In-Reply-To: <20210322155655.547476-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Mon, 22 Mar 2021 16:56:55 +0100")
References: <20210322155655.547476-1-giulio.benetti@benettiengineering.com>
Message-ID: <878s5z61fk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > These patches fix OpenRisc linker bug 27624 that affects packages
 > libtheora, protobuf and zeromq.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 >  .../0010-bfd-elf32-or1k-fix-ld-assert.patch   | 33 +++++++++++++++++++
 >  .../0003-bfd-elf32-or1k-fix-ld-assert.patch   | 33 +++++++++++++++++++
 >  .../0003-bfd-elf32-or1k-fix-ld-assert.patch   | 33 +++++++++++++++++++
 >  .../0003-bfd-elf32-or1k-fix-ld-assert.patch   | 33 +++++++++++++++++++
 >  4 files changed, 132 insertions(+)
 >  create mode 100644 package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch
 >  create mode 100644 package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch
 >  create mode 100644 package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch
 >  create mode 100644 package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
