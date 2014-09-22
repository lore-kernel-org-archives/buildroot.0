From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 22:42:17 +0200
Subject: [Buildroot] [PATCH 20/23 v5] docs/asciidoc: call $(pkgname) and
 $(pkgdir) in a single place
In-Reply-To: <b0636122e2367750eece267d01b569286603652d.1410692671.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <b0636122e2367750eece267d01b569286603652d.1410692671.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMLoU-pqoyLZ-LjDB3xgjaNb5yZcs_nE42hTjrSDgr=sqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
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

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
