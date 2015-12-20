From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Dec 2015 22:59:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/v4l2grab: Update hash after
 latest version bump
In-Reply-To: <1450638959-21314-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450638959-21314-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151220215919.GI3677@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-12-20 20:15 +0100, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/3aa/3aa8ac30de88c50539afaf7cd5ef10eb375c96f5/
> http://autobuild.buildroot.net/results/927/92792f6d7aa2f9b2b8d55315369164faa42c38af/
> http://autobuild.buildroot.net/results/09a/09a1931d9c117b678cc6ab9bd34f23aa84238d48/
> http://autobuild.buildroot.net/results/37d/37dee4ce618c511af8bdf7876e6038e907aba7a6/
> http://autobuild.buildroot.net/results/48d/48d1052240c6041db7ac7b82fafd8c02998becfc/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/v4l2grab/v4l2grab.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/v4l2grab/v4l2grab.hash b/package/v4l2grab/v4l2grab.hash
> index fc09f58..17beeec 100644
> --- a/package/v4l2grab/v4l2grab.hash
> +++ b/package/v4l2grab/v4l2grab.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 568d51512107226dab1ac809ab1ed4d544ce3f8f505b62c3b2177fb643c8157b v4l2grab-0abed72532bee02e545a1924b6883c839d50febf.tar.gz
> +sha256	ed5b9ca16c3b82d283df69c46aabd6c976b166b4e77b660288d86a147b68caf9	v4l2grab-6a52a234e227a30e16591d1a0e7afc52a2c5d964.tar.gz

Damned. I always forget that we now have hashes for github too.

I was wondering how I could make it work here. But now I realize that I
only really tested the previous iteration of the patch, which was adding
the two patches that are now upstream, and I only updated the version
without re-spawning a build. Bad, Yann, bad...

Thanks for fixing! :-)

Regards,
Yann E. MORIN.

> -- 
> 2.6.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
