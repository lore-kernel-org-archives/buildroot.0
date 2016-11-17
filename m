From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Nov 2016 21:47:39 +0100
Subject: [Buildroot] [PATCH 03/10] docs/manual: document the waf-package
 infra
In-Reply-To: <20161117000456.04b7e672@free-electrons.com>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <e41ab5eee8961c89c1fe9c4566383844e36b24f9.1477843328.git.yann.morin.1998@free.fr>
 <20161117000456.04b7e672@free-electrons.com>
Message-ID: <20161117204739.GD3574@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-11-17 00:04 +0100, Thomas Petazzoni spake thusly:
> On Sun, 30 Oct 2016 17:02:14 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > +* +LIBFOO_BUNDLED_WAF+ can be set to +YES+ or +NO+ to tell Buildroot to
> > +  use the bundled +waf+ executable. If set to +YES+, the default, then
> YES is in fact not the default :-)

Well, "! NO" is the default. ;-)

> > +  Buildroot will use the waf executable in the package source tree; if
> > +  set to +NO+, then Buidlroot will download and install waf as a
> Buildroot.

I Like Buidlroot. It sounds like Beetlejuice. ;-]

> > +  host-tool.
> host tool (i.e no dash in between).
> 
> No need to resend for these issues, I can fixup when applying.

Will you address the variable name in the infra at the same time, or
do you prefer I respin with the rename (in which case I can fix the
manual) ?

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
