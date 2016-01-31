From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 13:54:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/pax-utils: bump version to
	1.1.4 to fix musl build
In-Reply-To: <1454236206-28318-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 31 Jan 2016 11:30:06 +0100")
References: <1454236206-28318-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <871t8xkixp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The build error has not yet been found by the autobuilders:
 > elf.h:31:1: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?typedef?
 >  typedef uint16_t Elf32_Half;
 >  ^
 > elf.h:59:9: error: unknown type name ?Elf32_Half?
 >  typedef Elf32_Half Elf32_Versym;
 >          ^
 > [...]

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
