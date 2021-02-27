From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Feb 2021 19:00:44 +0100
Subject: [Buildroot] [PATCH] package/avrdude: Switch to upstream
In-Reply-To: <1fb4110698bd2c67f04061a8fc1320148540edd1.camel@gmail.com>
References: <20210222022606.491102-1-alexander.sverdlin@gmail.com>
 <20210222211535.GF2276@scaer>
 <1fb4110698bd2c67f04061a8fc1320148540edd1.camel@gmail.com>
Message-ID: <20210227180044.GJ2390841@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexnder, All,

On 2021-02-23 09:25 +0100, Alexander Sverdlin spake thusly:
> On Mon, 2021-02-22 at 22:15 +0100, Yann E. MORIN wrote:
> > > -AVRDUDE_VERSION = f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa
> > > -AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
> > > +AVRDUDE_VERSION = r1450
> > > +AVRDUDE_SITE_METHOD = svn
> > > +AVRDUDE_SITE = http://svn.savannah.nongnu.org/svn/avrdude/trunk
> > I am wondering what version of Buildroot you've been testing this with,
> > because downloading via svn is currently broken in master.
> > No need to reend for now, until we fix the svn download (imminent,
> > anytime soon, almost done, etc...)
> You've cought me :)
> Tested with 2020.11.x, rebased onto master.

Hehe. ;-)

The download via svn has been fixed in master, but the fix is still not
in -next, and since this is a version bump, it will then have to wait
for either master being merged into next (will most probably not
happen), or next being merged ijnto master after the release.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
