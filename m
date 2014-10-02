From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 2 Oct 2014 11:50:36 +0200
Subject: [Buildroot] [PATCH 21/25 v6] doc/asciidoc: allow documents to
 pass a global asciidoc configuration
In-Reply-To: <bd572581b91449ac1ddc176aed272afc882cb980.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <bd572581b91449ac1ddc176aed272afc882cb980.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LUA=T4_j+1S7xB5CeC7rTAvJQqwr91HvXQtUAOGSOHdrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, a document can specify an output-specific configuration, like
> the text output, that hides images references, and formats hyperlinks.
>
> But sometime it is required that a specific configuration is used for

sometimes

> all the output formats, to always apply the same markup rules in all
> documents (like using the [specialwords] section.)
>
> Also look for a file named 'asciidoc.conf' in the document's directory.
> If that file exists, add it to the asciidoc options (before the
> output-specific config, so the former takes precedence over the latter.)
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Aside from the above commit message change + the commit message change
indicated by Samuel:

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
