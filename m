From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 22:48:52 +0200
Subject: [Buildroot] [PATCH 21/23 v5] docs/asciidoc: make it possible to
 use $(@D) in hooks
In-Reply-To: <2dc7586ac17c407aef3adc68f49cbdb663074ed1.1410692671.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <2dc7586ac17c407aef3adc68f49cbdb663074ed1.1410692671.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMLTJxwZRH0J1A7Zp=Krfm7u6uENrQJc+GM7mzsUX1gL7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, it is not possible to use $(@D) in documents' hooks, because
> there is no actual target file for the copying rule.
>
> So, use the same mechanism as for generic-package.
>
> We do not touch the target file, so it is easy to regenerate the manual
> without calling the -clean rule first.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
