From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Mar 2013 00:39:31 +0100
Subject: [Buildroot] [PATCH 4/6] package/genimage: new host-only package
In-Reply-To: <20130310124158.65520084@skate>
References: <cover.1362693294.git.yann.morin.1998@free.fr>
 <40cdfc7c804704b95c963d3c76852e6d2b82de31.1362693294.git.yann.morin.1998@free.fr>
 <20130310124158.65520084@skate>
Message-ID: <201303110039.31451.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 10 March 2013 Thomas Petazzoni wrote:
> On Thu,  7 Mar 2013 22:55:29 +0100, Yann E. MORIN wrote:
> > +GENIMAGE_VERSION        = 4
> > +GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
> > +GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download/
> > +GENIMAGE_DEPENDENCIES   = libconfuse
> 
> Even though it is a host package, we could add:
> 
> GENIMAGE_LICENSE = GPLv2
> 
> Unfortunately, there is no license file.

I am a bit uneasy at adding licensing information for packages that are
purely host packages.

As you said in your other mail, this might confuse a user reviewing the
licensing terms.
But I will add it.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
