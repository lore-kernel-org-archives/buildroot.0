From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Aug 2016 16:34:29 +0200
Subject: [Buildroot] [PATCH 05/16 v3] core: move rule to create basic
 directories
In-Reply-To: <20160827161452.6bb81433@free-electrons.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <35c825b427c5e89497aafde9b787986eeeac1ad7.1468750623.git.yann.morin.1998@free.fr>
 <11c12539-f62e-0e2b-c6e3-b6bb2e9a1c12@gmail.com>
 <20160827161452.6bb81433@free-electrons.com>
Message-ID: <20160827143429.GC5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Thomas, All,

On 2016-08-27 16:14 +0200, Thomas Petazzoni spake thusly:
> On Sat, 6 Aug 2016 17:16:20 +0200, Romain Naour wrote:
> > Hi Yann,
> > 
> > Le 17/07/2016 ? 12:34, Yann E. MORIN a ?crit :
> > > Some of those directories will be needed even during configuration, like
> > > BUILD_DIR, where we'll store the generated kconfig snippet.
> > > 
> > > So, move the rule to create them outside the HAVE_CONFIG block.  
> > 
> > You mean BR2_HAVE_DOT_CONFIG here, right ?
> 
> Yann, could you reply to this comment? I think Romain is right, but I
> just want to be sure before fixing up myself when applying.

Yes, he's right, this should have been 'BR2_HAVE_DOT_CONFIG'.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
