From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 18:39:41 +0100
Subject: [Buildroot] [PATCH v4 1/5] mesa3d: pull out from x11
In-Reply-To: <BLU0-SMTP4083C56CA0B43BBAC9B3616D9750@phx.gbl>
References: <BLU0-SMTP4083C56CA0B43BBAC9B3616D9750@phx.gbl>
Message-ID: <20140310173941.GA3282@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-03-09 20:01 +0100, Bernd Kuhls spake thusly:

Maybe it would be nice to give in the commit log a bit more details on
why it makes sense to move it out of x11r7.

> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
[--SNIP--]
> diff --git a/package/Config.in b/package/Config.in
> index 70e5a7f..b0da653 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -188,6 +188,7 @@ source "package/fbv/Config.in"
>  source "package/imagemagick/Config.in"
>  source "package/linux-fusion/Config.in"
>  source "package/lite/Config.in"
> +source "package/mesa3d/Config.in"

If I understand correctly, mesa3d is an implementation of OpenGL. So,
*maybe* it would make sense to move it along the other OpenGL packages,
into package/opengl/.

But I'd like others to confirm this first.

Otherwise, looks good.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
