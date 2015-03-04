From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Mar 2015 18:51:40 +0100
Subject: [Buildroot] [PATCH 01/11 v5] package/freerdp: bump version
In-Reply-To: <20150304120212.5ea5fe4d@free-electrons.com>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
 <56dbfc1bf1b30d83d8a709da1a0106baaef65fe5.1424558036.git.yann.morin.1998@free.fr>
 <20150304120212.5ea5fe4d@free-electrons.com>
Message-ID: <20150304175140.GA4159@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-04 12:02 +0100, Thomas Petazzoni spake thusly:
> On Sat, 21 Feb 2015 23:36:14 +0100, Yann E. MORIN wrote:
> 
> > diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> > index 57cd7a8..ffe014c 100644
> > --- a/package/freerdp/freerdp.mk
> > +++ b/package/freerdp/freerdp.mk
> > @@ -5,7 +5,7 @@
> >  ################################################################################
> >  
> >  # Changeset on the stable-1.1 branch
> > -FREERDP_VERSION = 440916eae2e07463912d5fe507677e67096eb083
> > +FREERDP_VERSION = b21ff842ef3de5837513042dc30488b12bd9cf9d
> 
> Not sure if it's directly related, but it looks like it is: this new
> version of freerdp is breaking the build of VLC:
> 
>   http://autobuild.buildroot.org/?reason=vlc-2.1.6
> 
> According to https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=758382,
> bumping VLC to 2.2.0 fixes the problem, as it supports the new FreeRDP
> version properly.
> 
> Can you have a look?

Yup, I'm on it. Thanks for the hint! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
