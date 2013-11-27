From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Nov 2013 09:24:43 +0100
Subject: [Buildroot] [PATCH 2/2] qemu/mips64-malta: switch to eglibc
In-Reply-To: <1385513501-23157-2-git-send-email-gustavo@zacarias.com.ar>
References: <1385513501-23157-1-git-send-email-gustavo@zacarias.com.ar>
 <1385513501-23157-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131127092443.0c6ea9b9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 26 Nov 2013 21:51:41 -0300, Gustavo Zacarias wrote:

>  # Toolchain
> -# uClibc dynamic loader seems broken for mips64
> -BR2_PREFER_STATIC_LIB=y

I think the broken dynamic loader for mips64 in uClibc is now fixed by
package/uclibc/0.9.33.2/uclibc-0009-mips64-fix-n64-interp.patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
