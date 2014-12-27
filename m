From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 15:39:48 +0100
Subject: [Buildroot] [PATCH] package/nftables: do not build docs
In-Reply-To: <20141227144831.1e96cb3f@free-electrons.com>
References: <1419687052-24398-1-git-send-email-yann.morin.1998@free.fr>
 <20141227144831.1e96cb3f@free-electrons.com>
Message-ID: <20141227143948.GB4098@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-27 14:48 +0100, Thomas Petazzoni spake thusly:
> On Sat, 27 Dec 2014 14:30:52 +0100, Yann E. MORIN wrote:
> 
> > Note: patching the Makefile.am is the most straightforward way of doing
> > it, although we may also pre-set a bunch of variables when calling
> > ./configure;
> >   - DBLATEX=no to disable PDF generation
> >   - DOCBOOK2X_MAN=no, DOCBOOK2MAN=no and DB2X_DOCBOOK2MAN=no to disable
> >     manpage generation
> 
> Well, I believe I would actually prefer to use those environment
> variables rather than patching Makefile.am and having to autoreconf the
> package.

OK, I'll switch to that. Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
