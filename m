From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 09 Dec 2012 15:59:14 +0100
Subject: [Buildroot] [PATCH] tcl: add license information
In-Reply-To: <1354914901-4480-2-git-send-email-zinosat@tiscali.it>
References: <1354914901-4480-1-git-send-email-zinosat@tiscali.it>
 <1354914901-4480-2-git-send-email-zinosat@tiscali.it>
Message-ID: <50C4A742.3080707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/12/12 22:15, Davide Viti wrote:
>
> Signed-off-by: Davide Viti<zinosat@tiscali.it>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

> ---
>   package/tcl/tcl.mk |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
> index 606042e..ec089ee 100644
> --- a/package/tcl/tcl.mk
> +++ b/package/tcl/tcl.mk
> @@ -8,6 +8,8 @@ TCL_VERSION_MINOR = 19
>   TCL_VERSION = $(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
>   TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
>   TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
> +TCL_LICENSE = tcl license
> +TCL_LICENSE_FILE = license.terms
>   TCL_SUBDIR = unix
>   TCL_CONF_OPT = \
>   		--disable-symbols \

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
