From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 22:20:38 +0200
Subject: [Buildroot] [PATCH 17/23 v5] docs/manual: always look for
 ressources in destination directory
In-Reply-To: <f1a0a2c203f426242b9c35172efec6aba4f3dd54.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <f1a0a2c203f426242b9c35172efec6aba4f3dd54.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJeO49uZuOSvoqQvakDwDvb399evPgvOUMYdVq8hUasUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Our manual does not use external filters in asciidoc, so we are happy
> with just looking for ressources from our source tree.

s/ressources/resources/
(also in the patch title)

>
> However, other documents (like ones in br2-external) may use such
> filters, to generate diagrams, graphs...
>
> External filters generate their output files in the output directory, so
> we must also look for ressources in there.
>
> Note: external filters in asccidoc are used thus:
>     ["filter-name"]
>     ----
>     Text to be rendered
>     ----
>
> In the future, our own manual may even make use of filters to include
> some of the graphs we generate, to store in the documentation.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

With the aformentioned typo fixed:
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
