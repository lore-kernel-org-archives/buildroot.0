From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Jan 2015 00:39:16 +0100
Subject: [Buildroot] [PATCH v4 04/17] docs/manual: add documentation for
 the pkg-rebar infrastructure
In-Reply-To: <20150104232730.GE31970@free.fr>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-5-git-send-email-johan.oudinet@gmail.com>
 <20150104223334.08fc134c@free-electrons.com>
 <20150104232730.GE31970@free.fr>
Message-ID: <20150104233916.GF31970@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Johan, All,

On 2015-01-05 00:27 +0100, Yann E. MORIN spake thusly:
[--SNIP--]
> > > +* +ERLANG_FOOBAR_ENV+, to specify additional environment variables to
> > > +  pass both to the configure script and rebar.  By default, sets CC,
> > > +  CFLAGS, LDFLAGS, ERL_COMPILER_OPTIONS, and ERL_EI_LIBDIR.
> > 
> > Ah, so here we document $$(PKG)_ENV, which actually exists in the code.
> > How is that different from ERLANG_FOOBAR_REBAR_ENV above?

Hmm... In fact, for the configure step, we already have $(2)_CONF_ENV as
it only applies to autotools-based packages.

Non-autotools-based packages do not have a configure step.

So I'll aso remove that variable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
