From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Oct 2013 22:49:20 +0200
Subject: [Buildroot] [RFC PATCH] fs/common.mk: Add support for fakeroot
 script
In-Reply-To: <20131018202323.GA23065@gmail.com>
References: <20131015132102.GA20116@gmail.com> <20131015161941.5d7ffd45@skate>
 <20131018202323.GA23065@gmail.com>
Message-ID: <20131018204920.GA4019@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On 2013-10-18 15:23 -0500, Andrew Ruder spake thusly:
> On Tue, Oct 15, 2013 at 04:19:41PM +0200, Thomas Petazzoni wrote:
> > Well, the conventional way would be to have those directories created
> > by packages (and they can use the <pkg>_PERMISSIONS mechanism to get
> > proper ownership or permissions). Or, if they really don't belong to
> > any package, create them in the post build script, and have a device
> > table assign the permission and ownership.
> 
> I didn't realize the device table functionality could modify arbitrary
> file/directory ownerships but looking through the makedevs source code
> that DOES appear to be true.

Or you could have had a look at the manual:
    http://buildroot.net/downloads/manual/manual.html#makedev-syntax

The first sentence in this section reads:
    The makedev syntax is used in several places in Buildroot to define
    changes to be made for permissions. [...]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
