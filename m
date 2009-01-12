From: Hamish Guthrie <hamish.guthrie@sonycom.com>
Date: Mon, 12 Jan 2009 15:31:03 +0100
Subject: [Buildroot] arch support
In-Reply-To: <87ljtgj44z.fsf@macbook.be.48ers.dk>
References: <87ljtgj44z.fsf@macbook.be.48ers.dk>
Message-ID: <496B5427.6040103@sonycom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I just finished building the defconfigs for all the archs (uclibc
> 0.9.30 / kernel headers 2.6.28 / binutils 2.19 / gcc 4.3.2 except for
> avr32 which does it's own thing)
> 
I have been trying to build for various arch's (powerpc, mips, i386) 
with the above toolchain selections, but always wind up with the error:

configure: error: cannot compute suffix of object files: cannot compile
See `config.log' for more details.

during the gcc-4.3.2-initial stage of the build.

Are you building against HEAD?

Would it be possible for you to send me your powerpc defconfig please?

--
Hamish
