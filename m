From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:21:42 +0200
Subject: [Buildroot] [PATCH v3 1/1] package: remove the trailing slash
 sign from <PKG>_SITE variable
In-Reply-To: <1406796418-27918-2-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1406796418-27918-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1406796418-27918-2-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20140731232142.0ba145ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Thu, 31 Jul 2014 10:46:58 +0200, Jerzy Grzegorek wrote:
> Since the trailing slash is stripped from $($(PKG)_SITE) by pkg-generic.mk:
> 
> $(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE))
> 
> so it is redundant.
> This patch removes it from $(PKG)_SITE variable for BR consistency.
> 
> 
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
> Changes v2 -> v3
>   - rebase on top of the master
> Changes v1 -> v2
>   - change title
>     from: "package: remove the trailing slash sign from the URL address"
>     to:   "package: remove the trailing slash sign from $(PKG)_SITE variable"
>   - add description (Arnout Vandecappelle)

Thanks, applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
