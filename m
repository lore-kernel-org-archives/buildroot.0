From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 08 Mar 2012 16:31:59 +0100
Subject: [Buildroot] Building a kernel for i.MX23 (and probably other
 from the i.MX family)
In-Reply-To: <20120307141949.1a0e98ef@skate>
References: <20120307114528.0304fc3d8061b683b66c7230@kinali.ch>
 <20120307141949.1a0e98ef@skate>
Message-ID: <4F58D0EF.4090308@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/2012 02:19 PM, Thomas Petazzoni wrote:
> Hello Attila,
>
> Le Wed, 7 Mar 2012 11:45:28 +0100,
> Attila Kinali<attila@kinali.ch>  a ?crit :
>
>> After you have build LTIB you have to extract the elftosb2 binary
>> from it (/opt/freescale/ltib/usr/bin/elftosb2) and the imx-bootlets
>> package (/opt/freescale/pkgs/imx-bootlets-src-10.05.02.tar.gz)
> Note that I think the Armadeus people were interested in having tools
> like elftosb2 integrated within Buildroot. It would indeed be
> really nice to have this in Buildroot, so that users of i.MX systems
> can easily build images that can run on their targets.

AFAIK, elftosb is only needed for i.MX23x and i.MX28x, which are quite 
newcomers in the i.MX family.
Moreover if your i.MX23/28 systems has a FLASH chip onboard, .sb files 
are only needed to generate an bootable U-Boot image.
>> Overall i do not suggest using the i.MX processors for linux based
>> systems due to very bad support from freescale.
> I am not very familiar with the i.MX range of processors, but the guys
> from Pengutronix have done an enormous work in getting support for
> those processors into the mainline Linux kernel. Though I don't know if
> their work included support for the i.MX 23.

+1
Some Freescale guys are also also doing some hard work to mainline i.MX 
drivers.

Regards,
Julien
