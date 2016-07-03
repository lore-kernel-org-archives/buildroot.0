From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 3 Jul 2016 10:42:32 +0200
Subject: [Buildroot] [PATCH 1/3] docs/manual: document FOO_GIT_SUBMODULE
In-Reply-To: <379161dbd5720bdb842077d05b88e7437206ead8.1467534694.git.yann.morin.1998@free.fr>
References: <cover.1467534694.git.yann.morin.1998@free.fr>
 <379161dbd5720bdb842077d05b88e7437206ead8.1467534694.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJgg7gsPbj-m2OuWv3Wm-gnmusy5BzEO2NQLDc-7MQJ0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Sun, Jul 3, 2016 at 10:33 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  docs/manual/adding-packages-generic.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index de8aca2..2d7e677 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -310,6 +310,12 @@ information is (assuming the package name is +libfoo+) :
>       the package source code. Buildroot copies the contents of the
>       source directory into the package's build directory.
>
> +* +LIBFOO_GIT_SUBMODULES+, when +LIBFOO_SITE_METHOD=git+, will create
> +  an archive with the git submodules in the repository.
> +  Note that we try not to use such git submodules when they contain
> +  bundled librraries, in which case we prefer to use those libraries
s/librraries/libraries/

> +  from their own package.
> +
>  * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
>    (directories) that tar must strip from file names on extraction.
>    The tarball for most packages has one leading component named
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
