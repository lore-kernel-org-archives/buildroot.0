From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 22 Jan 2014 22:22:53 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: use absolute paths to
	BR2_EXTERNAL
In-Reply-To: <44e6c31931f55e79eec713be1a202f2c170667b7.1390424303.git.yann.morin.1998@free.fr>
References: <cover.1390424302.git.yann.morin.1998@free.fr>
 <44e6c31931f55e79eec713be1a202f2c170667b7.1390424303.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMKeN2jnnrW8iFBOhtJ670nnABeiGzMjC_R8eFMJc1sZBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/22 Yann E. MORIN <yann.morin.1998@free.fr>

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Using a relative path for BR2_EXTERNAL, and using an external defconfig,
> such as in (from a Buildroot top-dir):
>     make O=.. BR2_EXTERNAL=.. foo_defconfig
>
> is broken. It is unclear why the %_defconfig rule recurses in that case,
> but using relative paths is inherently broken.
>
> This patch makes BR2_EXTERNAL canonical (ie. makes it an absolute path),
> and checks the directory exists.
>
> The manual is updated to discourage using relative paths.
>
> Reported-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Romain Naour <romain.naour@openwide.fr>
>
Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,


-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140122/f8b99ae8/attachment.html>
