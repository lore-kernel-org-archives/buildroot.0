From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
Date: Tue, 25 Nov 2014 22:10:51 +0100
Subject: [Buildroot] [PATCH v2] mx53loco_defconfig: switch to VFPv3(d32)
In-Reply-To: <1494741.bpddRugsWT@sagittea>
References: <20141019163952.19c7c080@free-electrons.com>
 <20141125183017.31cb5e67@free-electrons.com>
 <20141125184429.74b70457@e6520eb.localdomain>
 <1494741.bpddRugsWT@sagittea>
Message-ID: <20141125221051.50c9eca0@e6520eb.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

Le Tue, 25 Nov 2014 12:57:00 -0800 (PST),
J?r?me Pouiller <jezz@sysmic.org> a ?crit :
> On Tuesday 25 November 2014 18:44:29 Eric B?nard wrote:
> > Le Tue, 25 Nov 2014 18:30:17 +0100,
> [...]
> > > Also, Eric, you mention the AMD GPU libraries, but do we have packages
> > > for those libraries in Buildroot? I know we have the ones for i.MX6,
> > > but what about i.MX53 ?
> > 
> > a patch adding the AMD GPU libraries was sent earlier this month by
> > J?r?me Pouiller : http://patchwork.ozlabs.org/patch/408174/
> > I can't find the new version but a patch depending on this one is
> > available so I assume a v2 will follow :
> > http://patchwork.ozlabs.org/patch/412521/
> They are two separate series. First one introduce iMX5 GPU driver while second 
> one introduce a new helper function to extract FSL archives. 
> 
Yes that's why I wrote the second depends on the first one ;-)

> I currently do not plan to make a v2 of iMX 5 GPU series.
> 
v1 is marked as superseded in patchwork and doesn't seems to be in
next : is that intended ?

Best regards,
Eric
