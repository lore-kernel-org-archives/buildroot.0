From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 14:51:08 +0200
Subject: [Buildroot] [PATCH 21/25 v6] doc/asciidoc: allow documents to
 pass a global asciidoc configuration
In-Reply-To: <CAHXCMMJJVd61GXek+tw4JQm87g3TBWL3eP15XmgK6pxaDMMV8g@mail.gmail.com>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <bd572581b91449ac1ddc176aed272afc882cb980.1411812968.git.yann.morin.1998@free.fr>
 <CAHXCMMJJVd61GXek+tw4JQm87g3TBWL3eP15XmgK6pxaDMMV8g@mail.gmail.com>
Message-ID: <20140927125108.GD4298@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-09-27 13:20 +0200, Samuel Martin spake thusly:
> On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Currently, a document can specify an output-specific configuration, like
> > the text output, that hides images references, and formats hyperlinks.
> >
> > But sometime it is required that a specific configuration is used for
> > all the output formats, to always apply the same markup rules in all
> > documents (like using the [specialwords] section.)
> >
> > Also look for a file named 'asciidoc.conf' in the document's directory.
> > If that file exists, add it to the asciidoc options (before the
> > output-specific config, so the former takes precedence over the latter.)
> 
> It is the other way around, no?
> (the output-specific config taking precedence over/overriding the
> sections defined in the global one)

Yes indeed; the commit log is backward. Fixed.
Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
