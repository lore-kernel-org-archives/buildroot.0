From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 31 May 2014 23:21:15 +0200
Subject: [Buildroot] [PATCH 07/11 RFC] package/cryptodev: make it behave
 more like other virtual packages
In-Reply-To: <fb4fd59c1256e4af634e09bde41079a0f14acbc8.1401395407.git.yann.morin.1998@free.fr>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
 <fb4fd59c1256e4af634e09bde41079a0f14acbc8.1401395407.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+gU6=m7DfVEUm9bYAox9vBKfVgBa8zL4-G1VYfTkM9OQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Thu, May 29, 2014 at 10:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Currently, the virtual package cryptodev is a special virtual package,
> as it offers a choice for its implementation, rather than letting the
> user enable them manually.
>
> In so doing, it defines its _HAS option as a 'def_bool y' rather than
> letting each implementation 'select' it.
>
> Since we are going to generate a list of virtual packages and their
> providers, this defeats the heuristic used to find providers.
>
> Coming with an alternate heuristic that also matches the cryptodev
> package is quite complex, so better and easier to make it look more
> like any other virtual package.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
