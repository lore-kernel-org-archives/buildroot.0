From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Oct 2014 21:20:28 +0200
Subject: [Buildroot] [PATCH 25/25 v6] docs/manual: document the asciidoc
	infra
In-Reply-To: <CAAXf6LXX5NkLrUUTjOV1YKOBpo07ZAug43FbMKte7VSdeu=z3Q@mail.gmail.com>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <b0043d14369f4ce8fe60762c8b48c85a72a55894.1411812968.git.yann.morin.1998@free.fr>
 <CAAXf6LXX5NkLrUUTjOV1YKOBpo07ZAug43FbMKte7VSdeu=z3Q@mail.gmail.com>
Message-ID: <20141002192028.GB19775@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-02 12:27 +0200, Thomas De Schampheleire spake thusly:
[--SNIP--]
> > +Finally, on line 8, we call the +asciidoc-document+ function, which
> > +generates all the Makefile code necessary to render the document.
> 
> 'Finally' is a bit an exaggeration here, as there was only one
> described line above it :)

I just mimicked what was done in the other package infras, to get as
consistent as possible. I'll rephrase.

> > +* +FOO_RESOURCES+, optional, may contain a space-separated list of paths
> > +  to one or more directories containing so-called resources (CSS,
> > +  images...) By default, empty.
> 
> Shouldn't there be a dot after the closing parentheses, to finish the sentence?

I was under the impression that a closing parenthses at the end of a
sentence would goble the punctuation mark.

So I checked a few on-line ressources.

It seems that (once not making it a rule), I was mislaid.

> > +There are also additional hooks (see xref:hooks[] for general information
> > +on hooks), that a document may set to define extra actions to be done at
> > +various steps:
> > +
> > +* +FOO_POST_RSYNC_HOOKS+ to run additional commands after the sources
> > +  have been copied by Buildroot. This can be used for, for example,
> > +  generating part of the manual with information extracted from the
> 
> I would write:
> This can for example be used for ...

OK.

Thanks! :-)

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
