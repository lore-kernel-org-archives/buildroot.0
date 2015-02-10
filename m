From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 10 Feb 2015 11:02:55 +0100
Subject: [Buildroot] [PATCH] git: fix static link with openssl
In-Reply-To: <ed0c71f0657461f6b03b20ab4afbc4567d87d4fa.1423557599.git.baruch@tkos.co.il>
References: <ed0c71f0657461f6b03b20ab4afbc4567d87d4fa.1423557599.git.baruch@tkos.co.il>
Message-ID: <54D9D74F.6090604@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch,

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

$ grep -E ^BR2_PACKAGE_OPENSSL .config
BR2_PACKAGE_OPENSSL=y
$ grep -E ^BR2_PACKAGE_GIT .config
BR2_PACKAGE_GIT=y
$ file output/build/git-2.3.0/git
output/build/git-2.3.0/git: ELF 32-bit LSB executable, MIPS, MIPS32
version 1 (SYSV), statically linked, with unknown capability 0xf41 =
0x756e6700, with unknown capability 0x70100 = 0x3040000, not stripped

Best regards,
--
Vincent
