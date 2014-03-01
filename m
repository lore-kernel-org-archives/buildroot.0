From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Mar 2014 21:52:07 +0100
Subject: [Buildroot] [PATCH 08/17] packages: add infrastructure for
	virtual packages
In-Reply-To: <e279c8b8-16ff-4bd4-ac15-371aa10e4203@email.android.com>
References: <cover.1393695127.git.yann.morin.1998@free.fr>
 <972572db05ab656c34dabde9a559255d0d386e25.1393695127.git.yann.morin.1998@free.fr>
 <e279c8b8-16ff-4bd4-ac15-371aa10e4203@email.android.com>
Message-ID: <20140301205207.GC3354@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2014-03-01 20:25 +0100, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >The virtual-package infrastructure allows to easily define a
> >virtual package in a single line:
[--SNIP--]
> I haven't yet checked the details of your series, but what about using
> this series as an opportunity to set the VERSION of a virtual package
> to 'virtual' instead of the default 'undefined'? This will be visible
> both in output/build as in the log messages...

OK, why not. I'll add that to the series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
