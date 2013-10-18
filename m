From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Oct 2013 00:07:43 +0200
Subject: [Buildroot] [RFC PATCH] fs/common.mk: Add support for fakeroot
 script
In-Reply-To: <20131018213504.GA23840@gmail.com>
References: <20131015132102.GA20116@gmail.com> <20131015161941.5d7ffd45@skate>
 <20131018202323.GA23065@gmail.com> <20131018204920.GA4019@free.fr>
 <20131018213504.GA23840@gmail.com>
Message-ID: <20131018220743.GB4019@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On 2013-10-18 16:35 -0500, Andrew Ruder spake thusly:
> On Fri, Oct 18, 2013 at 10:49:20PM +0200, Yann E. MORIN wrote:
> > Or you could have had a look at the manual:
> >     http://buildroot.net/downloads/manual/manual.html#makedev-syntax
> > 
> > The first sentence in this section reads:
> 
> Yes, taken out of context it looks perfect, but put the whole sentence
> in there and it sounds like it is specifically for device node creation.
> 
> > The makedev syntax is used in several places in Buildroot to define
> > changes to be made for permissions, or which device files to create
> > and how to create them, ***in order to avoid calls to mknod.***
> 
> Emphasis mine, of course.

OK, maybe previous knowledge of the features makes me read the section
in a way that makes it explicit for me. It might not look the same to
others. Then, perhaps you could provide a better wording for this? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
