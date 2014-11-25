From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 25 Nov 2014 12:57:00 -0800 (PST)
Subject: [Buildroot] [PATCH v2] mx53loco_defconfig: switch to VFPv3(d32)
In-Reply-To: <20141125184429.74b70457@e6520eb.localdomain>
References: <20141019163952.19c7c080@free-electrons.com>
 <20141125183017.31cb5e67@free-electrons.com>
 <20141125184429.74b70457@e6520eb.localdomain>
Message-ID: <1494741.bpddRugsWT@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Tuesday 25 November 2014 18:44:29 Eric B?nard wrote:
> Le Tue, 25 Nov 2014 18:30:17 +0100,
[...]
> > Also, Eric, you mention the AMD GPU libraries, but do we have packages
> > for those libraries in Buildroot? I know we have the ones for i.MX6,
> > but what about i.MX53 ?
> 
> a patch adding the AMD GPU libraries was sent earlier this month by
> J?r?me Pouiller : http://patchwork.ozlabs.org/patch/408174/
> I can't find the new version but a patch depending on this one is
> available so I assume a v2 will follow :
> http://patchwork.ozlabs.org/patch/412521/
They are two separate series. First one introduce iMX5 GPU driver while second 
one introduce a new helper function to extract FSL archives. 

I currently do not plan to make a v2 of iMX 5 GPU series.


BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
