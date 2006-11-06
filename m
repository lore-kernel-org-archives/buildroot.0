From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Mon, 6 Nov 2006 11:48:48 +0100
Subject: [Buildroot] strace unknown syscall trap 0xe1a00000
In-Reply-To: <20061106095413.GA5528@synertronixx3>
References: <20061106095413.GA5528@synertronixx3>
Message-ID: <20061106104848.GA8759@synertronixx3>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2006-11-06 10:54 +0100 schrieb Konstantin Kletschke:



> # strace echo
> execve("/bin/echo", ["echo"], [/* 15 vars */]) = 0
> syscall: unknown syscall trap 0xe1a00000

> Applying strace-fix-arm-bad-syscall.patch using plaintext: 
> patching file syscall.c

> http://www.fluff.org/ben/patches/strace/strace-fix-arm-bad-syscall.patch

*ARGH*

Actually this patch makes strace functional. I was puzzled and did not
use the patched version.

*rollseyes*

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
