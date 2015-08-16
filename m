From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2015 17:09:02 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/dosfstools: fix build
	with musl
In-Reply-To: <1439734181-1015-1-git-send-email-yann.morin.1998@free.fr>
References: <1439734181-1015-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150816150902.GG3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2015-08-16 16:09 +0200, Yann E. MORIN spake thusly:
> Use correct and standard int types.
[--SNIP--]
> diff --git a/package/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch b/package/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
> new file mode 100644
> index 0000000..3dd7c83
> --- /dev/null
> +++ b/package/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
> @@ -0,0 +1,45 @@
> +From 7a589ef6dab52ad32a296939f0ed2acb4d76b2a7 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Sun, 16 Aug 2015 15:55:43 +0200
> +Subject: [PATCH] mkfs.fat: fix incorrect int type
[--SNIP--]
> +Upstream status: submitted: https://github.com/dosfstools/dosfstools/pull/9

Since the patch was submitted, upstream has applied it.
So, new upstream status: applied.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
