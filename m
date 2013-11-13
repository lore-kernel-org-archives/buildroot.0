From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Nov 2013 18:48:01 +0100
Subject: [Buildroot] [git commit] Update for 2013.11-rc1
In-Reply-To: <20131112231429.89E849BBB5@busybox.osuosl.org>
References: <20131112231429.89E849BBB5@busybox.osuosl.org>
Message-ID: <5283BB51.5060101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/13 23:49, Peter Korsgaard wrote:
[snip]
> diff --git a/docs/download.html b/docs/download.html
> index 49c768d..dfba889 100644
> --- a/docs/download.html
> +++ b/docs/download.html
> @@ -14,15 +14,15 @@ or
>   <a href="/downloads/buildroot-2013.08.1.tar.bz2">buildroot-2013.08.1.tar.bz2</a>.
>
>   <p>
> -<!--
> -The latest release candidate is <b>2013.08-rc3</b>, which can be
> +
> +The latest release candidate is <b>2013.11-rc1</b>, which can be
>   downloaded here:<p>
>
> -<a href="/downloads/buildroot-2013.08-rc3.tar.gz">buildroot-2013.08-rc3.tar.gz</a>
> +<a href="/downloads/buildroot-2013.11-rc1tar.gz">buildroot-2013.11-rc1.tar.gz</a>

  Missing .

>   or
> -<a href="/downloads/buildroot-2013.08-rc3.tar.bz2">buildroot-2013.08-rc3.tar.bz2</a>.
> +<a href="/downloads/buildroot-2013.11-rc3.tar.bz2">buildroot-2013.11-rc1.tar.bz2</a>.
>   <p>
> --->
> +
>   This and earlier releases can always be downloaded from
>   <a href="/downloads/">http://buildroot.net/downloads/</a>.
>
> diff --git a/docs/news.html b/docs/news.html
> index 2560227..91ed85d 100644
> --- a/docs/news.html
> +++ b/docs/news.html
> @@ -5,6 +5,19 @@
>   <p>
>
>   <ul>
> +  <li><b>12 November 2013 -- 2013.11-rc1 released</b>
> +
> +    <p>We have a new release candidate! Lots of changes all over the
> +    tree, see the <a
> +    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11_rc1">CHANGES</a>

  I never noticed before, but why do you tag with _rc1 instead of -rc1 so 
it corresponds to the tarball?

  Regards,
  Arnout

> +    file for details.</p>
> +
> +    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
> +    <a href="/downloads/buildroot-2013.11-rc1.tar.bz2">2013.11-rc1
> +    release candidate</a>, and report any problems found to the <a
> +    href="lists.html">mailing list</a> or <a
> +    href="https://bugs.uclibc.org">bug tracker</a>.</p>
> +
>     <li><b>11 November 2013 -- Report from Buildroot Developers Meeting</b>
>
>       <p>A report from the recent
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
