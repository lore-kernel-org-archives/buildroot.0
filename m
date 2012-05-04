From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 May 2012 23:39:05 +0200
Subject: [Buildroot] How to create a Bootable SD-Card for i.MX28 EVK
In-Reply-To: <4FA4404F.7010109@onlinehome.de>
References: <4FA4404F.7010109@onlinehome.de>
Message-ID: <4FA44C79.80106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/04/12 22:47, Tobias Sachs wrote:
> Another Question when I select U-Boot as Bootloader I have to add a "U-Boot board name" but I can't find which names I 
> could use if I try "mxs" I get only the error listed below. 
  The U-Boot source tree has a 'boards.cfg' file that specifies all supported boards.  Look for it there.  Usually, the 
U-Boot board name has to be more specific than the kernel's board name (because the kernel has more auto-discovery 
features than U-Boot).  You'll find there that it's called "m28evk".

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
