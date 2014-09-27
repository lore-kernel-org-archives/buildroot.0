From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 14:40:34 +0200
Subject: [Buildroot] [PATCH 25/25 v6] docs/manual: document the asciidoc
	infra
In-Reply-To: <CAHXCMMKfUp=6=ff_rb5tTN86X-xQZbO_obs3SANhe8_ghsg_hw@mail.gmail.com>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <b0043d14369f4ce8fe60762c8b48c85a72a55894.1411812968.git.yann.morin.1998@free.fr>
 <CAHXCMMKfUp=6=ff_rb5tTN86X-xQZbO_obs3SANhe8_ghsg_hw@mail.gmail.com>
Message-ID: <20140927124034.GC4298@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-09-27 13:21 +0200, Samuel Martin spake thusly:
> On Sat, Sep 27, 2014 at 12:17 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > +01: ################################################################################
> > +02: #
> > +03: # foo-document
> > +04: #
> > +05: ################################################################################
> > +06:
> > +07: FOO_SOURCES = $(sort $(widcard $(pkgdir)/*))
> 
> s/widcard/wildcard/

Gah... I fixed the other one Thomas pointed out in the previous review,
and did not even think of looking if I borked that one too... :-/

[--SNIP--]
> With the aformentioned typo fixed:
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>

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
