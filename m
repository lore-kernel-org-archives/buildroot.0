From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 Dec 2015 13:07:57 +0100
Subject: [Buildroot] [PATCH 05/13 v2] core/pkg-generic: add variable to
 store the package rawname-version
In-Reply-To: <4640c83000bc6b54c6949415dc94a50187766f15.1450031251.git.yann.morin.1998@free.fr>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <4640c83000bc6b54c6949415dc94a50187766f15.1450031251.git.yann.morin.1998@free.fr>
Message-ID: <5671541D.8010909@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> Introduce a new per-package variable to store the 'rawname-version'
> tuple, instead of computing it every time we need it.
>
> Currently, it's only a single location, but follw-up patches will

follw-up -> follow-up

> introduce more use of it.
>
> Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

With the typo fixed:
  Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
