From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Dec 2015 15:16:37 +0000
Subject: [Buildroot] [PATCH] dbus: bump to version 1.10.6
In-Reply-To: <1449068532-14408-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449068532-14408-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <565F0B55.7020107@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 02/12/15 15:02, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep -E ^DBUS_VERSION package/dbus/dbus.mk
DBUS_VERSION = 1.10.6

$ file output/target/usr/bin/dbus-monitor
output/target/usr/bin/dbus-monitor: ELF 32-bit LSB executable, MIPS,
MIPS32 rel2 version 1, dynamically linked, interpreter /lib/ld.so.1, for
GNU/Linux 2.6.32, not stripped

Regards,

Vincent.
