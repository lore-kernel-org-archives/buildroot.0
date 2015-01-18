From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 15:35:03 +0100
Subject: [Buildroot] [PATCH] package/nettle: bump version
In-Reply-To: <20150118140638.GI2555@sapphire.tkos.co.il>
References: <1421589567-19731-1-git-send-email-yann.morin.1998@free.fr>
 <20150118140638.GI2555@sapphire.tkos.co.il>
Message-ID: <20150118143503.GG4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-01-18 16:06 +0200, Baruch Siach spake thusly:
> On Sun, Jan 18, 2015 at 02:59:27PM +0100, Yann E. MORIN wrote:
> > The patch we had to fix shared-only builds is no longer needed.
> > The licensing has changed to a mix of GPLv2+, GPLv3+ and LGPLv3+.
> 
> You mention GPLv2+ here ...
> 
> > -NETTLE_LICENSE = LGPLv2.1+
> > -NETTLE_LICENSE_FILES = COPYING.LIB
> > +NETTLE_LICENSE = GPLv3+, LGPLv3+
> 
> ... but here GPLv2+ is missing.

Ah, damn, you're right. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
