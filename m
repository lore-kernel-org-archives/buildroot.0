From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2014 11:08:32 +0100
Subject: [Buildroot] [pkg-perl infra V3 08/12]
 host-libmodule-build-perl: new package
In-Reply-To: <1385198749-6249-9-git-send-email-francois.perrad@gadz.org>
References: <1385198749-6249-1-git-send-email-francois.perrad@gadz.org>
 <1385198749-6249-9-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140204100831.GE3454@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2013-11-23 10:25 +0100, Francois Perrad spake thusly:
> the version coming with host-perl is too old
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../libmodule-build-perl/libmodule-build-perl.mk   |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 package/cpan/libmodule-build-perl/libmodule-build-perl.mk
> 
> diff --git a/package/cpan/libmodule-build-perl/libmodule-build-perl.mk b/package/cpan/libmodule-build-perl/libmodule-build-perl.mk
> new file mode 100644
> index 0000000..d874775
> --- /dev/null
> +++ b/package/cpan/libmodule-build-perl/libmodule-build-perl.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# libmodule-build-perl
> +#
> +################################################################################
> +
> +LIBMODULE_BUILD_PERL_VERSION = 0.4200
> +LIBMODULE_BUILD_PERL_AUTHOR = LEONT
> +LIBMODULE_BUILD_PERL_SOURCE = Module-Build-$(LIBMODULE_BUILD_PERL_VERSION).tar.gz
> +LIBMODULE_BUILD_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT/
> +HOST_LIBMODULE_BUILD_PERL_DEPENDENCIES =

Missing _LINCENSE and _LICENSE_FILES.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
