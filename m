From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Oct 2015 23:20:11 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/shairport-sync: bump to
 version 2.4.1
In-Reply-To: <1444597880.3974.0.camel@embedded.rocks>
References: <1444597369-27828-1-git-send-email-joerg.krause@embedded.rocks>
 <20151011210725.GE24916@free.fr>
 <1444597880.3974.0.camel@embedded.rocks>
Message-ID: <20151011212011.GF24916@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2015-10-11 23:11 +0200, J?rg Krause spake thusly:
> On So, 2015-10-11 at 23:07 +0200, Yann E. MORIN wrote:
> > J?rg, All,
> > 
> > On 2015-10-11 23:02 +0200, J?rg Krause spake thusly:
> > > Remove backported from upstream patch.
> > 
> > You could have added something like:
> > 
> > ????Fix autoreconf comment that was wrong.
> > 
> > (No need to resend, it can be fixed at commit time by a maintainer).
> > 
> > > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > 
> > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> > > ---
> > > Changes v1 -> v2:
> > > ? - Fix autoreconf comment (Baruch Siach)
> 
> I did it in the changelog...

Yeah, I saw that. However, the commit-changelog in good for noting
changes between versions of the patch, so that reviewers quickly notice
what has changed between those two revisions of the patch.

The commitlog proper is good for historical records, like "why on Earth
did we change that comment 6 months ago?".

The commit-changelog does not end-up in the history of the project
(i.e. it is dropped when a maintainer applies the patch), while the
commitlog is preserved.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
