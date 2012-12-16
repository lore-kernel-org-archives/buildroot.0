From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2012 21:20:51 +0100
Subject: [Buildroot] [git commit] usbredir: bump version
In-Reply-To: <20121216200126.2D9129A29B@busybox.osuosl.org>
References: <20121216200126.2D9129A29B@busybox.osuosl.org>
Message-ID: <201212162120.51365.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Sunday 16 December 2012 Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=da1147e763737f5dd4da3d20c5bf2109d5d85562
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  package/usbredir/usbredir.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
> index ac98472..f0530a7 100644
> --- a/package/usbredir/usbredir.mk
> +++ b/package/usbredir/usbredir.mk
> @@ -4,7 +4,7 @@
>  #
>  #############################################################
>  
> -USBREDIR_VERSION         = 0.4.3
> +USBREDIR_VERSION         = 0.4.4

Yes, since we want to use qemu 1.2, we still need usbredir 0.4.
Since this series was started before 0.4.4 was released, I missed it.

When I upgrade QEMU to 1.3.0, I'll also update usbredir version.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
