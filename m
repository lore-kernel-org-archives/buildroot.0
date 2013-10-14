From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 14 Oct 2013 21:37:07 +0200
Subject: [Buildroot] [PATCH 4/4] ngrep: add license information
In-Reply-To: <1381759541-15243-4-git-send-email-phil@zankapfel.net>
References: <1381759541-15243-1-git-send-email-phil@zankapfel.net>
 <1381759541-15243-4-git-send-email-phil@zankapfel.net>
Message-ID: <CAAXf6LWpHP+6=8-+564hLFuwt9VJKXBJxTa8UV8pKeNHMezFyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Phil,

On Mon, Oct 14, 2013 at 4:05 PM, Phil Eichinger
<phil.eichinger@gmail.com> wrote:
>
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
>  package/ngrep/ngrep.mk |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
> index 99b8f46..e25d3a2 100644
> --- a/package/ngrep/ngrep.mk
> +++ b/package/ngrep/ngrep.mk
> @@ -7,6 +7,8 @@
>  NGREP_VERSION = 1.45
>  NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
>  NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSION)
> +NGREP_LICENSE = BSD-Style

Is it possible to map this onto any of the standard abbreviations as
specified here:
http://buildroot.uclibc.org/downloads/manual/manual.html#legal-info-list-licenses

i.e. BSD-2c, BSD-3c, or BSD-4c ?

> +NGREP_LICENSE_FILES = LICENSE.txt
>  NGREP_INSTALL_STAGING = YES
>  NGREP_CONF_ENV = LDFLAGS="-lpcre"
>  NGREP_CONF_OPT =  \

Best regards,
Thomas
