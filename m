From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jul 2019 17:53:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/musl: bump to version 1.1.23
In-Reply-To: <20190730102331.25609-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 30 Jul 2019 12:23:30 +0200")
References: <20190730102331.25609-1-joerg.krause@embedded.rocks>
Message-ID: <871ry77c33.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > This version merges the RISC-V (64-bit) port and new math library
 > implementations of log, exp, and pow. Internals of how (non-cancellable)
 > syscalls are performed have been overhauled so that all code necessary to make
 > the syscall resides in the arch-provided header and is inlinable. In the
 > process, bugs in the implementation of mips and microblaze syscall mechanisms
 > were found and fixed. Several other bugs were fixed as well, including a
 > potentially serious one in the layout of static TLS for shared libraries on
 > archs that use "TLS variant I" layout.

 > A couple behaviors that were clearly undesirable but arguably mandated by POSIX
 > have been fixed as a result of POSIX intepretations rendering them unnecessary.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
