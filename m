From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Aug 2012 18:57:01 +0200
Subject: [Buildroot] [PATCH] package/crosstool-ng: update to 1.16.0
In-Reply-To: <20120806145702.3d8e652e@skate>
References: <1344197156-20586-1-git-send-email-yann.morin.1998@free.fr>
 <20120806145702.3d8e652e@skate>
Message-ID: <201208061857.02059.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 06 August 2012 14:57:02 Thomas Petazzoni wrote:
> Le Sun,  5 Aug 2012 22:05:56 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/crosstool-ng/crosstool-ng.mk               |    2 +-
> >  .../crosstool-ng.config-eglibc                     |   29 +++++++++------
> >  .../crosstool-ng.config-glibc                      |   28 +++++++++------
> >  .../crosstool-ng.config-uClibc                     |   39 +++++++++++---------
> >  4 files changed, 58 insertions(+), 40 deletions(-)
> 
> Ok, I've made an exception for this and pushed it to master even though
> version bumps are not supposed to be merged at this point. If anything
> breaks because of this, I'll revert :-)

Yes, sure. But as crosstool-NG is (usually) released the day buildroot
switches to -rc1, it's not easy to submit before -rc1. And Peter usually
accepted this bump after -rc1.

But I do understand your point of view as the substitue maintainer to be
chilly on this. ;-)

Be sure to keep me posted if things break, so I have a chance to fixing it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
