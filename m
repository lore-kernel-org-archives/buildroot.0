From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 21:44:58 +0200
Subject: [Buildroot] [PATCH v2] Makefile: delete HOSTFC and FC_FOR_BUILD
In-Reply-To: <1428578935-13452-1-git-send-email-yamada.masahiro@socionext.com>
References: <1428578935-13452-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <20150409214458.6aa30b36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Masahiro Yamada,

On Thu,  9 Apr 2015 20:28:55 +0900, Masahiro Yamada wrote:
> This definition of HOSTFC is completely wrong.
> 
> "$(HOSTLD)" should be "$(HOSTFC)".  Also, "echo" always succeeds, so
> "which g77 || type -p g77 || echo gfortran" is never run.
> 
> Anyway, HOSTFC is most likely set to "/use/bin/ld" and nobody has
> complained about it before me, so I guess it is not used at all.
> 
> At least grepping HOSTFC, FC_FOR_BUILD did not hit any packages.
> Drop HOSTFC and FC_FOR_BUILD.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
