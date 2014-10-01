From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 1 Oct 2014 22:01:33 +0200
Subject: [Buildroot] [PATCH 16/25 v6] docs/manual: always look for
 resources in destination directory
In-Reply-To: <e702f65c92fdba984da7fc58d184fb25679972aa.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <e702f65c92fdba984da7fc58d184fb25679972aa.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LVjsxyE4dM+hHf85L2fDb3uQuw7zLDsGD-v=SVm4Swbyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Our manual does not use external filters in asciidoc, so we are happy
> with just looking for resources from our source tree.
>
> However, other documents (like ones in br2-external) may use such
> filters, to generate diagrams, graphs...
>
> External filters generate their output files in the output directory, so
> we must also look for resources in there.
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
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
>

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
