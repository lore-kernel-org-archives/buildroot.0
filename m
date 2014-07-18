From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Jul 2014 19:41:57 +0200
Subject: [Buildroot] [PATCH] infar/pkg-autotools: cleanup the gettextize
 step
In-Reply-To: <1686bcb1-de48-4e4b-9b75-2204aeaa19c6@email.android.com>
References: <1405704310-7013-1-git-send-email-yann.morin.1998@free.fr>
 <1686bcb1-de48-4e4b-9b75-2204aeaa19c6@email.android.com>
Message-ID: <20140718174157.GB3630@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-18 19:34 +0200, Thomas De Schampheleire spake thusly:
> Commit title: infra
> 
> 
> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >Align the way to call gettextize to the way we call autoreconf.
> >Use of -f even if the package provides its own options.
> >Soem eye-candy in the output of gettextize.
> 
> Some

Thanks! That was anyway a quick dump of a local patch to share with
Thomas P. for a debug session.

I will fix those typoes before I re-submit. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
