From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Dec 2015 15:50:26 +0000
Subject: [Buildroot] [PATCH] p11-kit: bump to version 0.23.2
In-Reply-To: <1449576547-5982-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449576547-5982-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5666FC42.7070007@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 08/12/15 12:09, Gustavo Zacarias wrote:
> 0002-rpc-transport.c-include-sys-select.h-for-fd_set.patch is upstream
> so drop it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep -E ^P11_KIT_VERSION package/p11-kit/p11-kit.mk
P11_KIT_VERSION = 0.23.2

$ file output/target/usr/bin/p11-kit
output/target/usr/bin/p11-kit: ELF 32-bit LSB executable, MIPS, version
1 (SYSV), dynamically linked, interpreter /lib/ld-linux-mipsn8.so.1, for
GNU/Linux 4.0.0, stripped

Regards,

Vincent.
