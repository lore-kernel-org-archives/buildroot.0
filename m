From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 May 2013 22:56:18 +0200
Subject: [Buildroot] [PATCH 2/3] package/libedit2: new package
In-Reply-To: <519332C6.9080509@mind.be>
References: <cover.1368567696.git.yann.morin.1998@free.fr>
 <527cc033d0024e5562a9e5984423088bf343921a.1368567696.git.yann.morin.1998@free.fr>
 <5192BA45.6010401@mind.be> <20130514224214.GB8043@free.fr>
 <519332C6.9080509@mind.be>
Message-ID: <20130515205617.GA3265@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-05-15 09:01 +0200, Arnout Vandecappelle spake thusly:
> On 15/05/13 00:42, Yann E. MORIN wrote:
> >Arnout, All,
> >
> >On 2013-05-15 00:27 +0200, Arnout Vandecappelle spake thusly:
> >>  Why is it called libedit2? Both NetBSD and Debian call it libedit...
> >
> >Debian actually calls it:
> >     libedit2
> >     libedit-dev
> >See: http://packages.debian.org/search?keywords=libedit
> 
>  The digit after the libxxx binary is the library soname, which isn't
> relevant for us. You should consider the source package name as the upstream
> name.

Fair enough. Will rename. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
