From: Pierre Ficheux <pierre.ficheux@openwide.fr>
Date: Mon, 23 Dec 2013 17:51:15 +0100 (CET)
Subject: [Buildroot] Booting problem for Beaglebone
In-Reply-To: <20131223174522.40f9884a@skate>
Message-ID: <1543357072.16990017.1387817475904.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I guess :) but my question was "is there any work in progress to fix it ?" before trying by myself ! 

regards

----- Mail original -----
> De: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> ?: "Pierre Ficheux" <pierre.ficheux@openwide.fr>
> Cc: buildroot at busybox.net
> Envoy?: Lundi 23 D?cembre 2013 17:45:22
> Objet: Re: [Buildroot] Booting problem for Beaglebone
> 
> Dear Pierre Ficheux,
> 
> On Mon, 23 Dec 2013 16:08:18 +0100 (CET), Pierre Ficheux wrote:
> 
> > I still have the same problem with recent BR (2013.11 or Git) and
> > Beaglebone Black (waiting for root device)
> > 
> > [    4.690564]      host=10.5.16.129, domain=daviel.openwide.fr.,
> > nis-domain=(none)
> > [    4.698407]      bootserver=0.0.0.0, rootserver=0.0.0.0,
> > rootpath=
> > [    4.704779]      nameserver0=10.5.1.1[    4.712875] Waiting for
> > root device /dev/mmcblk0p4...
> 
> It generally means that the MMC driver is missing, or that the MMC
> controller is not properly described in the Device Tree.
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 

-- 
Pierre FICHEUX -/- CTO OW/OWI, France -\- pierre.ficheux at openwide.fr
                                         http://ingenierie.openwide.fr
                                         http://www.linuxembedded.fr
I would love to change the world, but they won't give me the source code
