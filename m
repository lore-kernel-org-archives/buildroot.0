From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 May 2013 23:48:44 +0200
Subject: [Buildroot] [PATCH] toolchain/gcc: Introduce
 BR2_ARCH_HAS_GCC_x_y_PLUS
In-Reply-To: <5183E67C.9040202@mind.be>
References: <1367570270-2242-1-git-send-email-mjonker@synopsys.com>
 <5183E67C.9040202@mind.be>
Message-ID: <20130503234844.028d28f3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 03 May 2013 18:31:56 +0200, Arnout Vandecappelle wrote:

>   I'm not very excited about the sparcleon situation. But perhaps that 
> architecture can be deprecated? It's not even in our autobuilders AFAIK.

I think we had one guy interested in the SPARC Leon support. I remember
proposing to remove SPARC support entirely, and one person stepped up
to say that he was using SPARC Leon stuff. See
http://lists.busybox.net/pipermail/buildroot/2010-July/036382.html.

I don't think Sam ever sent any patch related to SPARC support.

However, Konrad Eisele sent a bunch of SPARC related patches. However,
the last SPARC-related patches Konrad has sent have been sent on
November 2010. He later sent some other patches (November 2011), but
they were kconfig related, and were extensions to the kconfig language,
something we're not ready to accept if they are not part of the
upstream kconfig code in the Linux kernel.

I've added Sam and Konrad in Cc to see if they are still using SPARC
support, and whether it's worth adding a sparc sample to our
autobuilders.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
