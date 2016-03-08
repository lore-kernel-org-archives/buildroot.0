From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 23:13:32 +0100
Subject: [Buildroot] [PATCH v2 1/2] help: add a way to document targets
 declared in local.mk/external.mk
In-Reply-To: <20160308221049.GB14289@free.fr>
References: <1457473693-25776-1-git-send-email-jezz@sysmic.org>
 <20160308221049.GB14289@free.fr>
Message-ID: <20160308231332.1fbef781@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 8 Mar 2016 23:10:49 +0100, Yann E. MORIN wrote:

> This definitely does not look nice to me... :-(
> 
> What we could do, however, would be:
> 
>   - in external.mk:
>         BR2_HAS_EXTRA_HELP = YES  # Whatever non empty
> 
>   - in the main Makefile:
> 
>         help:
>             blabla our current help
>             $(if $(BR2_HAS_EXTRA_HELP),echo "  - local-help  to get local help blabla)
> 
> which would be IMHO much much nicer and much much simpler...

But it doesn't allow PATCH 2/2.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
