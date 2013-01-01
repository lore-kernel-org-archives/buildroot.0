From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2013 16:36:05 +0100
Subject: [Buildroot] [PATCH 1/3] system/skeleton: add the shadow-group
	file
In-Reply-To: <20130101102606.258d780e@skate>
References: <cover.1356909238.git.yann.morin.1998@free.fr>
 <201212311918.08866.yann.morin.1998@free.fr> <20130101102606.258d780e@skate>
Message-ID: <201301011636.05672.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 01 January 2013 Thomas Petazzoni wrote:
> On Mon, 31 Dec 2012 19:18:08 +0100, Yann E. MORIN wrote:
> > Wrong. Groups can have passwords. And users can change-group with:
[--SNIP--]
> The next question that comes up is: do we really need to support this
> in Buildroot?

Well, I interpreted the abscence of that file as an oversight, that's why
I thought of adding it.

Right, we probably do not need the change-group feature in buildroot.
However, for the sake of consistency, I think it is good to have gshadow.

But I can very well live without it, sure.

Anyway... Happy New Year to all! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
