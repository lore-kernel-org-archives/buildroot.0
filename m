From: Bernhard Fischer <rep.nop@aon.at>
Date: Mon, 9 Oct 2006 13:44:45 +0200
Subject: [Buildroot] PowerPC kernel headers
In-Reply-To: <20061009082642.GA20352@igloo.df.lth.se>
References: <20061009082642.GA20352@igloo.df.lth.se>
Message-ID: <20061009114445.GA4637@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 09, 2006 at 10:26:42AM +0200, Fredrik Roubert wrote:
>Hi!
>
>Recently the possibility to use the Linux 2.6.18 kernel headers has been
>added to buildroot. However, the correct asm directory for PowerPC has
>changed from "ppc" to "powerpc", as part of the move to a unified kernel
>architecture for 32 and 64 bit PowerPC system.
>
>The attached patch updates kernel-headers.mk to use asm-powerpc when
>building with the 2.6.18 kernel headers.

I just checked in r16345 that uses headers_install for the full kernel.
This should make your patch unnecessary, i'd say. Please confirm.
