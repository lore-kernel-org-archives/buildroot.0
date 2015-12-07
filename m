From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Dec 2015 13:50:37 +0000
Subject: [Buildroot] [PATCH] nano: bump to version 2.5.0
In-Reply-To: <1449494483-14576-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449494483-14576-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <56658EAD.3050309@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 07/12/15 13:21, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/bin/nano
output/target/usr/bin/nano: ELF 32-bit LSB executable, MIPS, MIPS32 rel2
version 1 (SYSV), dynamically linked, interpreter /lib/ld.so.1, for
GNU/Linux 2.6.32, stripped

$ grep -E ^NANO_VERSION package/nano/nano.mk
NANO_VERSION = 2.5.0

Regards,

Vincent.
