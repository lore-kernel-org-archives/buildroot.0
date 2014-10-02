From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 2 Oct 2014 11:45:40 +0200
Subject: [Buildroot] [PATCH 20/25 v6] docs/asciidoc: make it possible to
	use $(@D) in hooks
In-Reply-To: <8291d284f786c9c6964f895f5757ce49158c68bd.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <8291d284f786c9c6964f895f5757ce49158c68bd.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LV-zT=_pR=85GugM3nKNCeJrEXiAupv5kOV1quN=a12Ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, it is not possible to use $(@D) in documents' hooks, because
> there is no actual target file for the copying rule.
>
> So, use the same mechanism as for generic-package.
>
> We do not touch the target file, so it is easy to regenerate the manual
> without calling the -clean rule first.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
