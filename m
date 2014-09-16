From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 16 Sep 2014 19:07:53 +0200
Subject: [Buildroot] [PATCH 2/2] Add supporit for Vivante xdriver
In-Reply-To: <20140916164655.5e2b10a9@free-electrons.com>
References: <533A8F6C.1010606@gmail.com>
 <1396368972-8690-3-git-send-email-jezz@sysmic.org>
 <20140916164655.5e2b10a9@free-electrons.com>
Message-ID: <6934033.ltB7kF42ss@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 16 September 2014 16:46:55 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Tue,  1 Apr 2014 18:16:12 +0200, J?r?me Pouiller wrote:
> > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> > ---
> > 
> >  package/x11r7/Config.in                            |  1 +
> >  package/x11r7/xdriver_xf86-video-imx-viv/Config.in | 22 ++++++
> >  ...mx-viv-001-Register-autotools-subprojects.patch | 31 +++++++++
> >  ...driver_xf86-video-imx-viv-002-Fix-compile.patch | 80
> >  ++++++++++++++++++++++ .../xdriver_xf86-video-imx-viv.mk                
> >   | 17 +++++
> >  5 files changed, 151 insertions(+)
> >  create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> >  create mode 100644
> >  package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-001-
> >  Register-autotools-subprojects.patch create mode 100644
> >  package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-002-
> >  Fix-compile.patch create mode 100644
> >  package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
> I did a review of this patch on April, 20th, making several comments
> and asking for a new version of the patch. Are you still interested in
> getting this merged into Buildroot?
> 
> I believe this would be a useful addition, but this patch has been sent
> 5 months ago, and never sent an updated version. Could you let us know
> what is the status of the patch, so that we can update our patch
> tracking system?

Initially, I sent this patch to answer to Marco's question (I should add in a 
comment that it was not destined to upstream).

I know it would be a nice addition (I have also imx5 support in stock). 
However, this package rely on specific versions of xorg, libdrm, kernel, 
etc... So, it was always broken. 

Freescale developments seems to be stabilized now. I may try to respin this 
patch. In any case, new version will be completely different than this one.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
