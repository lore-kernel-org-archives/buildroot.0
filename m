From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2014 14:47:01 +0200
Subject: [Buildroot] [PATCH 2/3] infra: add gettextize run in AUTORECONF
In-Reply-To: <53C3CFB1.8070101@zacarias.com.ar>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
 <1405186024-8170-2-git-send-email-gustavo@zacarias.com.ar>
 <20140714130104.480ab4cf@free-electrons.com>
 <20140714123048.GB3684@free.fr> <53C3CFB1.8070101@zacarias.com.ar>
Message-ID: <20140714124701.GC3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-07-14 09:40 -0300, Gustavo Zacarias spake thusly:
> On 07/14/2014 09:30 AM, Yann E. MORIN wrote:
> > Should I revive the series I did a while ago, that did just that?
> 
> A couple of fixes:
> It needs the filter-out addition for host-gettext in
> package/pkg-autotools.mk (like AUTORECONF does), and probably a tiny
> mention that GETTEXTIZING without AUTORECONF is useless.

Yep.

> Also we might be able to filter gettextizing out when
> gettext/host-gettext aren't pulled in - no infra version mismatch to
> account for, hence time savings.

But we can only know that when the package is extracted+patched, which
is too late for the dependency rules, no?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
