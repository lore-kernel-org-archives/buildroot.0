From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jan 2014 22:26:03 +0100
Subject: [Buildroot] [git commit] package/tzdata: install a default
 localtime
In-Reply-To: <52CF4270.4000707@free-electrons.com>
References: <20140109205952.2AAEA9C413@busybox.osuosl.org>
 <20140110072223.5bb42cc1@skate>
 <52CF4270.4000707@free-electrons.com>
Message-ID: <20140128212603.GE3466@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexandre, All,

On 2014-01-10 01:44 +0100, Alexandre Belloni spake thusly:
> On 10/01/2014 00:22, Thomas Petazzoni wrote:
> > Dear Peter Korsgaard,
> > 
> > On Thu, 9 Jan 2014 21:23:05 +0100, Peter Korsgaard wrote:
> >> commit: http://git.buildroot.net/buildroot/commit/?id=f96e4d7f348ce1b7b53763f102bbedb1ef6a1991
> >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> >>
> >> Add an option to install a default localtime.
> >>
> >> since tzdata only makes sense for (e)glibc, we don't care
> >> that we install timezone files that uClibc can't understand.
> >>
> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> > 
> > I know I should have raised my voice earlier, but I'm not entirely sure
> > about this one. Instead of having this as a tzdata specific option, I'd
> > very much prefer to have a "System configuration" option that allows to
> > set the default time zone, and which works for both glibc and uClibc.
> > 
> > Alexandre Belloni has posted some patches some time ago around time
> > zone handling with uClibc, it would have be great to have a better
> > integration here.
> > 
> 
> Yeah, it is still on my todo list. I'm trying to get the timezone
> specification generated automatically but it requires some host packages
> and I still didn't take the time to do that correctly.

Ping? What's your status on this?

Since I'm interested in that as well, do you want to push your branch
somewhere, so I can pull from it and complete the missing bits?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
