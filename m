From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 28 May 2014 10:10:06 -0500
Subject: [Buildroot] [git commit] Update for 2014.05-rc3
In-Reply-To: <20140528150759.D9D909CE02@busybox.osuosl.org>
References: <20140528150759.D9D909CE02@busybox.osuosl.org>
Message-ID: <CAEBucnBYj0sxMvBDwc4ODE=E2PLq7MhPP1UkHBekc8_8B08npg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 28, 2014 at 10:07 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=d830cceba5350f75c5a753c81811ed19cd3d17c2
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  CHANGES            |   16 ++++++++++++++++
>  Makefile           |    2 +-
>  docs/download.html |   10 +++++-----
>  docs/news.html     |   12 ++++++++++++
>  4 files changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/CHANGES b/CHANGES
> index edce6de..e5b416c 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -1,3 +1,19 @@
> +2014.05-rc3, Released May 28th, 2014
> +
> +       Minor fixes.
> +
> +       Updated/fixed packages: acl, attr, connman, dosfstools,
> +       dropbear, dvb-apps, exim, flite, gdb, httping, hwdata,
> +       lesstif, libnss, libv4l, lttng-babeltrace, midori, monit,
> +       mplayer, php, python2, rdesktop, rpi-userland, ruby, samba,
> +       samba4, slang, xbmc
> +
> +       Issues resolved (http://bugs.uclibc.org):
> +
> +       #7100: license info for package 'acl' missing
> +       #7106: license info for package 'attr' missing
> +       #7112: license info for package 'hwdata'
> +
>  2014.05-rc2, Released May 21st, 2014
>
>         Fixes all over the tree.
> diff --git a/Makefile b/Makefile
> index b7a0721..8ccfbd8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -25,7 +25,7 @@
>  #--------------------------------------------------------------
>
>  # Set and export the version string
> -export BR2_VERSION := 2014.05-rc2
> +export BR2_VERSION := 2014.05-rc3
>
>  # Check for minimal make version (note: this check will break at make 10.x)
>  MIN_MAKE_VERSION = 3.81
> diff --git a/docs/download.html b/docs/download.html
> index 7493980..e77338c 100644
> --- a/docs/download.html
> +++ b/docs/download.html
> @@ -15,14 +15,14 @@ or
>
>  <p>
>
> -The latest release candidate is <b>2014.05-rc2</b>, which can be
> +The latest release candidate is <b>2014.05-rc3</b>, which can be
>  downloaded here:<p>
>
> -<a href="/downloads/buildroot-2014.05-rc2.tar.gz">buildroot-2014.05-rc2.tar.gz</a>
> -(<a href="/downloads/buildroot-2014.05-rc2.tar.gz.sign">PGP signature</a>)
> +<a href="/downloads/buildroot-2014.05-rc3.tar.gz">buildroot-2014.05-rc3.tar.gz</a>
> +(<a href="/downloads/buildroot-2014.05-rc3.tar.gz.sign">PGP signature</a>)
>  or
> -<a href="/downloads/buildroot-2014.05-rc2.tar.bz2">buildroot-2014.05-rc2.tar.bz2</a>
> -(<a href="/downloads/buildroot-2014.05-rc2.tar.bz2.sign">PGP signature</a>).
> +<a href="/downloads/buildroot-2014.05-rc3.tar.bz2">buildroot-2014.05-rc3.tar.bz2</a>
> +(<a href="/downloads/buildroot-2014.05-rc3.tar.bz2.sign">PGP signature</a>).
>  <p>
>
>  This and earlier releases (and their PGP signatures) can always be downloaded from
> diff --git a/docs/news.html b/docs/news.html
> index 1b04eb8..21efa38 100644
> --- a/docs/news.html
> +++ b/docs/news.html
> @@ -6,6 +6,18 @@
>
>  <ul>
>
> +  <li><b>28 May 2014 -- 2014.05-rc3 released</b>
> +
> +    <p>Release candidate 3 is out with more cleanups and build fixes. See the <a
> +    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05-rc3">CHANGES</a>
> +    file for details.</p>
> +
> +    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
> +    <a href="/downloads/buildroot-2014.05-rc3.tar.bz2">2014.05-rc3
> +    release candidate</a>, and report any problems found to the <a
> +    href="lists.html">mailing list</a> or <a
> +    href="https://bugs.uclibc.org">bug tracker</a>.</p>
> +
>    <li><b>21 May 2014 -- 2014.05-rc2 released</b>
>
>      <p>Another week, another release candidate with more cleanups and
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Peter,

You may want to change the bugs site to https://bugs.buildroot.org.

Thanks,
Spenser

-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
