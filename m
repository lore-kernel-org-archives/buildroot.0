From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:58:29 +0200
Subject: [Buildroot] [PATCH] core/pkg-kconfig: use olddefconfig when
 available
In-Reply-To: <1461433564-21311-1-git-send-email-yann.morin.1998@free.fr>
References: <1461433564-21311-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160424235829.7a539557@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Apr 2016 19:46:04 +0200, Yann E. MORIN wrote:

> +# Helper to extract the make rule specified in $(2) from all the make rules
> +# of the package specified in $(1).
> +# Returns a non-empty string (the rule itself) of the rule exist; returns

of the rule exist -> if the rule exists

> +# The correct way to regenerate a .config file is to use 'make olddefconfig'.
> +# For historical reasons, the target name is 'oldnoconfig' between Linux kernel

I believe it sounded better with:

 "the target name *was* 'oldnoconfig' ..."

I've applied after fixing those minor nits! Thanks Romain and Yann for
working on this topic!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
