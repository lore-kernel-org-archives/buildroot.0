From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Dec 2012 22:20:26 +0100
Subject: [Buildroot] [PATCH 12/51] package/slirp: new package
In-Reply-To: <20121209194223.439bff79@skate>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
 <1355070924-8009-13-git-send-email-yann.morin.1998@free.fr>
 <20121209194223.439bff79@skate>
Message-ID: <201212092220.26330.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 09 December 2012 Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Sun,  9 Dec 2012 17:34:45 +0100, Yann E. MORIN wrote:
> > +# Note: The license file 'COPYRIGHT' is missing from the sources,
> > +# although some files refer to it.
> > +SLIRP_INSTALL_STAGING = YES
> > +SLIRP_AUTORECONF      = YES
> 
> Justification for the _AUTORECONF=YES here?

There's no release tarball, so we're using the git tree, so there's no
./configure, so we need to autoreconf.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
