From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Jan 2019 14:43:58 +0100
Subject: [Buildroot] [PATCH] musl: bump to version 1.1.21
In-Reply-To: <20190122085436.4940-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 22 Jan 2019 09:54:36 +0100")
References: <20190122085436.4940-1-joerg.krause@embedded.rocks>
Message-ID: <87womwoli9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > From the upstream release announcement:
 > """
 > This release makes improvements with respect to default thread stack size,
 > including increasing the default from 80k to 128k, increasing the default
 > guard size from 4k to 8k, and allowing the default to be increased via ELF
 > headers so that programs that need larger stacks can be build without
 > source-level changes, using just LDFLAGS. Insufficient stack size for AIO
 > threads on kernels that don't honor the constant MINSIGSTKSZ is also fixed.

 > The glob core has been rewritten to fix inability to see past
 > searchable-but-unreadable path components, and to avoid excessive stack usage
 > and unnecessary syscalls. The tsearch AVL tree implementation has also been
 > rewritten for better size and performance. The math library adds more native
 > single-instruction implementations for arm, s390x, powerpc, and x86_64.

 > Various bugs are fixed, including several possible deadlocks, one of which was
 > a new regression in 1.1.20.
 > """

 > Drop upstream patch 0002 which is included in the release.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
