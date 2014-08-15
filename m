From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 Aug 2014 12:14:49 +0200
Subject: [Buildroot] [PATCH 3 of 5 v3 for 2014.08] gendoc infra: add
 support for asciidoc configuration files
In-Reply-To: <7437dd86ef456d137451.1407957949@localhost>
References: <patchbomb.1407957946@localhost>
 <7437dd86ef456d137451.1407957949@localhost>
Message-ID: <CAHXCMML-Nj1+-XCdm8sYZSFQ0_5xhmJ6rRfiT3a7T_+0uQtvYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 13, 2014 at 9:25 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> This patch introduces support for asciidoc configuration files, specific for
> each output format (html, text, pdf, ...). This is useful to make certain
> tweaks in the document generation.
>
> If a file docs/manual/asciidoc-<format>.conf is present, it is passed to
> asciidoc as configuration file. If no file for the current format is
> present, the options passed to asciidoc are empty.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
