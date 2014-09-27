From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 27 Sep 2014 13:20:38 +0200
Subject: [Buildroot] [PATCH 17/25 v6] docs: separate the GENDOC infra
	from our manual definition
In-Reply-To: <3bb98f8ff99048b158b334b5f0ac29a5c694f05f.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <3bb98f8ff99048b158b334b5f0ac29a5c694f05f.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJMCQQC=51PYHpgfOsquA--1=mc7PtkpNghad4E6S14BQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Move the GENDOC infra to its own file, so it is even less tied to our
> manual document, so that it is more obvious that GENDOC is an infra like
> our packages infras, and 'manual' is a document like we have packages.
>
> Ideally, this new file should better go in docs/ rather than in package/ .
> However, docs/ is already full of our website stuff, so adding it in
> there would just serve to clutter the website.
>
> So, let's just put alongside the other infrastructures, in package/ .
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>


-- 
Samuel
