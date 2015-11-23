From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 Nov 2015 14:51:12 +0000
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.3.19
In-Reply-To: <1448287431-25909-1-git-send-email-gustavo@zacarias.com.ar>
References: <1448287431-25909-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <565327E0.7@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 23/11/15 14:03, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/bin/gnutls-cli
output/target/usr/bin/gnutls-cli: ELF 32-bit LSB executable, MIPS,
MIPS32 rel2 version 1 (SYSV), dynamically linked, interpreter
/lib/ld.so.1, for GNU/Linux 2.6.32, stripped

$ grep -E ^GNUTLS_VERSION package/gnutls/gnutls.mk
GNUTLS_VERSION_MAJOR = 3.3
GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).19

Regards,

Vincent.
