From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 11:58:22 +0100
Subject: [Buildroot] [PATCH 0/3] xtensa build fixes using
 -mtext-section-literal
In-Reply-To: <cover.1388480526.git.baruch@tkos.co.il>
References: <cover.1388480526.git.baruch@tkos.co.il>
Message-ID: <20131231115822.309acf3b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 31 Dec 2013 11:07:28 +0200, Baruch Siach wrote:
> These fixes are all similar. As the helpful linker error message says, xtensa 
> needs -mtext-section-literal when building too large 
> objects/libraries/binaries. So just do as we are told to.
> 
> Baruch Siach (3):
>   php: fix build for xtensa
>   lmbench: fix build for xtensa
>   civetweb: fix build for xtensa
> 
>  package/civetweb/civetweb.mk | 3 +++
>  package/lmbench/lmbench.mk   | 4 ++++
>  package/php/php.mk           | 4 ++++
>  3 files changed, 11 insertions(+)

All three patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
