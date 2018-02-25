From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 18:26:19 +0100
Subject: [Buildroot] Drop support for Qt 5.6? [was: [RFC 1/2] qt5: bump
 latest version to 5.10.0]
In-Reply-To: <78215947-020b-17da-27d8-89bcdfe1c859@mind.be>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
 <20180211161320.8864-2-gael.portay@savoirfairelinux.com>
 <1518442630960-0.post@n4.nabble.com>
 <78215947-020b-17da-27d8-89bcdfe1c859@mind.be>
Message-ID: <20180225172619.GA2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-02-25 18:06 +0100, Arnout Vandecappelle spake thusly:
> On 12-02-18 14:37, nimaim wrote:
> > This is semi unrelated, but along would this, would it make sense to bump the
> > current Qt LTS version from 5.6.x to 5.9.x (currently 5.9.4, which should
> > also be bumped from the 5.9.3 currently in the BR repo), and use this 5.10.x
> > version as BR2_PACKAGE_QT5_VERSION_LATEST as currently proposed?
> 
>  The problem is that 5.6.x is the last version that still was LGPL-2.0. For some
> companies this could be a problem.
> 
>  That said, I'm not particularly in favour of keeping old, unmaintained and
> probably vulnerable versions of packages just for companies' irrational fears of
> 3.0. It is clear from all the conditions we currently have that such maintenance
> does not come for free...
> 
>  So, any objections to replace Qt 5.6 with Qt 5.9?

Yes, I do object it.

As you said, this is the last version that was GPL-2/LGPL-2.1 (for most
parts), so removing it means some companies will be left out in the
cold, not being able to update.

This was one of the most important reasons this choice was added.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
