From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 19 Nov 2015 11:44:07 +0100
Subject: [Buildroot] [PATCH 2/2] help: relocate help messages specific
	to one package
In-Reply-To: <20151118154912.408690e7@free-electrons.com>
References: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
 <1447857421-9380-2-git-send-email-jezz@sysmic.org>
 <20151118154912.408690e7@free-electrons.com>
Message-ID: <29551021.aMD2rVc6HH@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wednesday 18 November 2015 15:49:12 Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 18 Nov 2015 15:37:01 +0100, J?r?me Pouiller wrote:
> > Use $LOCAL_HELP feature in order to integrate help messages specific
> > to one package (linux-menuconfig, etc...) package they are
> > related.
> > 
> > It would be possible to do it using kconfig framework, but I was not
> > sure it is necessary to document kconfig targets systematicaly.
> > 
> > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> > ---
> > 
> >  Makefile                   | 16 ----------------
> >  boot/barebox/barebox.mk    |  5 +++++
> >  linux/linux.mk             |  7 +++++++
> >  package/busybox/busybox.mk |  4 ++++
> >  package/uclibc/uclibc.mk   |  4 ++++
> >  5 files changed, 20 insertions(+), 16 deletions(-)
> 
> I already proposed something achieving a similar thing (but more
> integrated into the package infrastructure) a while ago, and it wasn't
> accepted.
> 
> See:
> 
>  
> http://lists.busybox.net/pipermail/buildroot/2015-January/118159.html

Indeed, second patch of my series seems achieving a similar thing (it's 
a pity arguments provided to reject it were not logged). 

However I think first patch has really different aim.


BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
