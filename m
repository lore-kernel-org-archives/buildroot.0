From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:21:27 +0200
Subject: [Buildroot] [PATCH 1/1] manual/adding-packages-perl.txt: remove
 the trailing slash sign from description of PERL_SITE variable
In-Reply-To: <1406796418-27918-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1406796418-27918-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20140731232127.68bdd635@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Thu, 31 Jul 2014 10:46:57 +0200, Jerzy Grzegorek wrote:
> Since the trailing slash is stripped from $($(PKG)_SITE) by pkg-generic.mk:
> 
> $(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE))
> 
> so it is redundant.
> 
> 
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  docs/manual/adding-packages-perl.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
