From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Aug 2012 22:48:32 +0200
Subject: [Buildroot] [PATCH] package/crosstool-ng: update to 1.16.0
In-Reply-To: <20120805221832.0d7d45ae@skate>
References: <1344197156-20586-1-git-send-email-yann.morin.1998@free.fr>
 <20120805221832.0d7d45ae@skate>
Message-ID: <201208052248.32983.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 05 August 2012 22:18:32 Thomas Petazzoni wrote:
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
> Wouldn't it be possible to use mini-defconfigs instead of those
> full .config?

Yes, it would be nice, but there's no provision in crosstool-NG to use a
defconfig file, except from the bundeled samples.

I'll add this feature so that it is available in the next release.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
