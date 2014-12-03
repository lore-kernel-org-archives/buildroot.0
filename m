From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Wed, 3 Dec 2014 15:07:40 -0300
Subject: [Buildroot] [PATCH v4 0/9] target permissions
In-Reply-To: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20141203180740.GA18880@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

On Fri, Nov 21, 2014 at 01:18:59PM -0300, Guido Mart?nez wrote:
>[...]
> Guido Mart?nez (9):
>   Makefile: don't depend on the umask
>   Makefile: don't depend on current skeleton/overlay permissions
>   toolchain/helpers.mk: use --chmod on rsync
>   pkg-generic.mk: don't depend on external package permissions
>   package: matchbox-keyboard: use install instead of cp
>   scripts: mkmakefile: set umask before calling BR's makefile
>   nitrogen6x: use install instead of cp
>   boot/grub: use install instead of cp
>   fs/iso9660: use install instead of cp
> 
>  Makefile                                              | 19 +++++++++++++++++--
>  board/boundarydevices/nitrogen6x/post-build.sh        |  6 +++---
>  boot/grub/grub.mk                                     | 14 +++++++-------
>  fs/iso9660/iso9660.mk                                 | 16 +++++++++-------
>  .../matchbox/matchbox-keyboard/matchbox-keyboard.mk   |  2 +-
>  package/pkg-generic.mk                                |  2 +-
>  support/scripts/mkmakefile                            |  2 +-
>  toolchain/helpers.mk                                  |  2 +-
>  8 files changed, 40 insertions(+), 23 deletions(-)
> 

Any comments on this? Has anyone tested/reviewed the new set?

Cheers!

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
