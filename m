From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 27 May 2009 18:18:14 -0300
Subject: [Buildroot] [git commit] docs/news.html: announce 2009.05-rc3
In-Reply-To: <20090527185736.B35FD7786B@busybox.osuosl.org>
References: <20090527185736.B35FD7786B@busybox.osuosl.org>
Message-ID: <d6cda7730905271418hff6ebd3s1636e6e0266a2eb6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The link http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05_rc3
shows no content for me. IE says 404, while Firefox just gives me no
content what so ever. Even if I right click and select "View Source",
it's also blank. It's linke the webserver replies the GET with a
close() or something like that.

Regards,
   Thiago A. Correa

On Wed, May 27, 2009 at 3:55 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=3d89b8d64e380de16d97eccd53504b38aa0c4cdb
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
> ?docs/news.html | ? 13 +++++++++++++
> ?1 files changed, 13 insertions(+), 0 deletions(-)
>
> diff --git a/docs/news.html b/docs/news.html
> index 8007133..f73f53b 100644
> --- a/docs/news.html
> +++ b/docs/news.html
> @@ -5,6 +5,19 @@
> ?<p>
>
> ?<ul>
> + ?<li><b>27 May 2009 -- 2009.05-rc3 released</b>
> +
> + ? ?<p>We had a number of fixes post-RC2, so RC3 is out (see <a
> + ? ?href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05_rc3">CHANGES</a>
> + ? ?for details). Now is the moment to test and verify that everything
> + ? ?is working for your favorite config - Expect a final 2009.05 very soon.</p>
> +
> + ? ?<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
> + ? ?<a href="/downloads/buildroot-2009.05-rc3.tar.bz2">2009.05-rc3
> + ? ?release candidate</a>, and report any problems found to the <a
> + ? ?href="lists.html">mailing list</a> or <a
> + ? ?href="http://bugs.uclibc.org">bug tracker</a>.</p>
> +
> ? <li><b>19 May 2009 -- 2009.05-rc2 released</b>
>
> ? ? <p>RC2 is out with more cleanups and bug fixes (see <a
> --
> 1.6.0.6
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
