From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 11 Jun 2014 11:26:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-06-09
References: <20140610063009.EDF82100CE6@stock.ovh.net>
 <20140610224740.325449ec@free-electrons.com>
Message-ID: <XnsA3497473349AFberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140610224740.325449ec at free-electrons.com: 

>>    powerpc |                  mesa3d-10.2.1 | NOK |
>>    http://autobuild.buildroot.net/results/8797db138307033f44a4554f15d2d5
>>    5378cfaff0/ 
> Bernd, can you fix these issues quickly? Otherwise we'll have to revert
> your patches.

Hi,

here is the patch fixing the problem:
http://patchwork.ozlabs.org/patch/357086/

It is not necessary to let mesa3d depend on udev.

Regards, Bernd
