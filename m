From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jul 2013 21:58:26 +0200
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
In-Reply-To: <51E6C06C.8070300@zacarias.com.ar>
References: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
 <20130717175838.2fc2831e@skate> <51E6C06C.8070300@zacarias.com.ar>
Message-ID: <20130717215826.60942218@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 17 Jul 2013 13:03:56 -0300, Gustavo Zacarias wrote:

> > Which leads me to this question: is adding Thumb support as simple as
> > what you're adding? Aren't there some additional thumb-interworking
> > complexities to handle?
> 
> http://infocenter.arm.com/help/topic/com.arm.doc.ihi0042e/IHI0042E_aapcs.pdf
> Section 5.6 is of interest, once OABI (APCS) was dropped interworking
> isn't that hard since it's mandatory for AAPCS.

Ok, so if I select "Thumb" for ARMv5T, but use a normal ARMv5
external toolchain (compiled ARM, not Thumb), it should work. Am I
correct?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
