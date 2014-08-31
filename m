From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 Aug 2014 14:47:16 +0200
Subject: [Buildroot] [PATCH for 2014.08] manual/user
 guide/customization: rework section on rootfs customization
In-Reply-To: <719dc9b97304bf8fdfbd.1409486840@localhost>
References: <719dc9b97304bf8fdfbd.1409486840@localhost>
Message-ID: <20140831124716.GA3908@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-31 14:07 +0200, Thomas De Schampheleire spake thusly:
[--SNIP--]
> - split post-image to a separate section, as it is not related to the target
>   filesystem customization
[--SNIP--]
> diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
> --- a/docs/manual/customize.txt
> +++ b/docs/manual/customize.txt
> @@ -40,6 +40,8 @@
>  
>  include::customize-rootfs.txt[]
>  
> +include::customize-post-image.txt[]

Did you forget to 'git add docs/manual/customize-post-image.txt' by
chance? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
