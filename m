From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jul 2013 00:09:11 +0200
Subject: [Buildroot] [PATCH v2] package/libedit: switch to alternate URL
 for proper packaging
In-Reply-To: <20130729202611.3b68bd14@skate>
References: <1375116257-27967-1-git-send-email-yann.morin.1998@free.fr>
 <20130729202611.3b68bd14@skate>
Message-ID: <20130729220911.GA3420@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-07-29 20:26 +0200, Thomas Petazzoni spake thusly:
> On Mon, 29 Jul 2013 18:44:17 +0200, Yann E. MORIN wrote:
> 
> > -LIBEDIT_DEPENDENCIES    = host-pmake libbsd ncurses
> 
> Does this implies we can get rid of the pmake and libbsd packages?

I think we can indeed get rid of pmake, yes. I'll submit a patch.

But I see no reason to remove libbsd. The package is clean, simple and
autotools-based, and it would not be the only library which is not a
dependency of an internal package.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
