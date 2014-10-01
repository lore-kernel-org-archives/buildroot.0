From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 1 Oct 2014 22:03:09 +0200
Subject: [Buildroot] [PATCH 19/25 v6] docs/asciidoc: call $(pkgname) and
 $(pkgdir) in a single place
In-Reply-To: <2fbef4ce75c382d53a2cc26dab17ac4ecb4f9c95.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <2fbef4ce75c382d53a2cc26dab17ac4ecb4f9c95.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LWZt-vXy1neqN4NW+A4KWforsUAQ8TO9ukCuFOaw4zjpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Like for all the package infrastructures, retrieve the package name and
> directory in the front-end macro-variable, rather than everywhere in the
> backend macro.
>
> This allows us to clean up the ASCIIDOC macro, by removing all the calls
> to $(pkgname) and $(pkgdir), and to UPPERCASE (which made the macro a
> bit difficult to read.)
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
>

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
