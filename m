From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 24 Sep 2014 21:28:16 +0200
Subject: [Buildroot] [PATCH 18/23 v5] docs: separate the GENDOC infra
	from our manual definition
In-Reply-To: <308773fe2883c6a3a4e13be8fdabcf3f2ba6c42a.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <308773fe2883c6a3a4e13be8fdabcf3f2ba6c42a.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LVQzNVtyqp9N0n=e_YxoKb7CpROHevaSOqb9TfT=Nsr2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Move the GENDOC infra to its own file, so it is even less tied to our
> manual document, so that it is more obvious that GENDOC is an infra like
> our packages infras, and 'manual' is a document like we have packages.
>
> Ideally, this new file should better go in docs/ rather than in package/ .
> However, docs/ is already full of our website stuff, so adding it in
> there would just serve to clutter the website.

Based on the input on the move of the website, it could go directly in
docs/ anyway.

Other than that:

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
