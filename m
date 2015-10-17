From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Oct 2015 11:42:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/wavpack: bump to version 4.75.2
In-Reply-To: <1444978001-8473-1-git-send-email-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Fri, 16 Oct 2015 08:46:41
 +0200")
References: <1444978001-8473-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <87r3ktzv92.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Autoreconf is not necessary anymore.
 > WavPack "autodetects" CPU type to enable ASM code. However, the assembly code
 > for ARM is written for ARMv7 only and building WavPack for an ARM-non-v7
 > architecture will fail. We explicitly enable ASM for the supported
 > architectures x86, x64 and ARMv7 and disable it for all others.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
