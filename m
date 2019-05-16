From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@collabora.com>
Date: Thu, 16 May 2019 11:55:04 -0400
Subject: [Buildroot] [PATCH 1/1] package/qt5webkit-examples: fix build
 with qt5webkit
In-Reply-To: <e887602b-3adc-6769-84d2-c1f8f7f7b005@mind.be>
References: <20190513202210.1706-1-fontaine.fabrice@gmail.com>
 <20190513231059.524b1bf1@windsurf.home>
 <CAPi7W80y+fU1g+66ueL1F8=DqTpSnH-tbCqaO8KL_2bg-CFDhQ@mail.gmail.com>
 <e887602b-3adc-6769-84d2-c1f8f7f7b005@mind.be>
Message-ID: <20190516155503.5ksq7ohgr7r66kah@archlinux.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, May 14, 2019 at 10:00:35PM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 13/05/2019 23:18, Fabrice Fontaine wrote:
> > Dear Thomas,
> > 
> > Le lun. 13 mai 2019 ? 23:11, Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> a ?crit :
> >>
> >> Hello,
> >>
> >> On Mon, 13 May 2019 22:22:10 +0200
> >> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >>
> >>> Fixes:
> >>>  - http://autobuild.buildroot.org/results/68dd6f1ffed49f8e2570f7364e5e635573807d3e
> >>>
> >>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >>
> >> Is this for both Qt latest and Qt LTS ?
> > Yes, I tested this patch with both of them. However, I don't know why
> > these build failures started on March 14th
> > (http://autobuild.buildroot.org/?reason=qt5webkit-examples%).
> > Did we make some changes to Qt5 around this date?
> 
>  qt5webkit wouldn't build until 2d7c746ed8 committed on Mar 7, so we'd never get
> around to building qt5webkit-examples.
> 

Thanks for the investigation and the patch :)

IIRC, I was working on that issue for the bump to 5.12. I think
something has changed in qtbase that causes that build issue. But I did
not have the time to work on it then :/

>  Regards,
>  Arnout
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Ga?l
