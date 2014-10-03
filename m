From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 3 Oct 2014 21:35:31 +0200
Subject: [Buildroot] [PATCH 22/25 v7] doc/asciidoc: always apply
	Buildroot's AsciiDoc config
In-Reply-To: <b51e19fba14d9312dd95efc9a1e87e30902a4192.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
 <b51e19fba14d9312dd95efc9a1e87e30902a4192.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LX_J7jFrQdaqBc21LtoeUbopD2m69kQeHNT92_TGorM=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 3, 2014 at 7:01 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> As suggested by Thomas: the AsciiDoc options we use ensure we get a sane
> output of the document. We want that configuration to be applied to
> other documents as well.
>
> Up until now, it was implicit that the configuration was applied to
> our manual, becasue we only supported document-specific configuration,
> and the configuration we had was in our manual dir, so we got to use it.
>
> But now, we can render other documents, especially ones from
> br2-external, and we want those to also use the default configuration
> from Buildroot, but still be able to provide their own customisation.
>
> So, always add Buildroot's configuration first, if available, before we
> append the document's configuration.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
