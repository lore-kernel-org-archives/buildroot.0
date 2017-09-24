From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Sep 2017 21:52:54 +0200
Subject: [Buildroot] [PATCH 30/49 v2] package/libqb: new package
In-Reply-To: <20170924194530.GF2660@scaer>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <c5a9ad9b87390d6b6b0a16d1f647ce7c4f2fd92e.1504993178.git.yann.morin.1998@free.fr>
 <627dd05c-f4e7-990a-50d0-a167bf81bdfa@mind.be>
 <20170924194530.GF2660@scaer>
Message-ID: <20170924195254.GG2660@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-09-24 21:45 +0200, Yann E. MORIN spake thusly:
> On 2017-09-23 18:51 +0200, Arnout Vandecappelle spake thusly:
> > On 09-09-17 23:39, Yann E. MORIN wrote:
> > [snip]
> > > +LIBQB_VERSION = v1.0.1
> > > +LIBQB_SITE = $(call github,ClusterLabs,libqb,$(LIBQB_VERSION))
> > 
> >  There is an uploaded tarball (which probably contains a configure script).

And even if there is a configure script, we still need to autoreconf,
since we still need to patch configure.ac.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
