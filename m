From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Dec 2013 18:27:22 +0100
Subject: [Buildroot] [PATCHv2] pkg-config: remove deprecated
In-Reply-To: <1386247960-10328-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386247960-10328-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131205182722.298202ad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  5 Dec 2013 09:52:40 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                                  |  1 -
>  package/pkg-config/Config.in                       | 19 --------------
>  .../pkg-config/pkg-config-0.25-fix-variable.patch  | 30 ----------------------
>  package/pkg-config/pkg-config.mk                   | 12 ---------
>  package/pkgconf/pkgconf.mk                         |  2 --
>  5 files changed, 64 deletions(-)
>  delete mode 100644 package/pkg-config/Config.in
>  delete mode 100644 package/pkg-config/pkg-config-0.25-fix-variable.patch
>  delete mode 100644 package/pkg-config/pkg-config.mk

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
