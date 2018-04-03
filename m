From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 12:52:21 +0200
Subject: [Buildroot] [PATCH] libbsd: disable for xtensa and blackfin
In-Reply-To: <5fdc56808ca93b202132a4fd5721854d8678b1c5.1522733137.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 3 Apr 2018 08:25:37 +0300")
References: <5fdc56808ca93b202132a4fd5721854d8678b1c5.1522733137.git.baruch@tkos.co.il>
Message-ID: <87370ck1ei.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit d879be30495 (package/libbsd: enable for non-glibc toolchains)
 > implicitly enabled libbsd for the uClibc only architectures xtensa and
 > blackfin. But libbsd does not support these architectures, since its
 > local-elf.h header lacks the required target specific definitions.

 > Fixes:
 > http://autobuild.buildroot.net/results/ff1/ff1a52a53bed43cda9e235081a61b352e6e07aa1/
 > http://autobuild.buildroot.net/results/b13/b13c2f248f277c72b5d266208f991f34474cea14/
 > http://autobuild.buildroot.net/results/182/182356701c2110a014c9d6c8d9f18a6efeb26e70/

 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: J?rg Krause <joerg.krause@embedded.rocks>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
