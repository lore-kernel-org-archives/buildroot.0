From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 05 Oct 2012 23:34:30 +0200
Subject: [Buildroot] Buildroot Issue with a uImage build
In-Reply-To: <7D8DC74DEB12384E8E4F5EE4879A8497401F03B5@USMANSMEXPW01>
References: <7D8DC74DEB12384E8E4F5EE4879A8497401F03B5@USMANSMEXPW01>
Message-ID: <506F5266.9030305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/10/12 21:21, Morrison, Tom wrote:
> I was pointed to a patch that Peter K. had added a default config. For the Boundary Devices
> Nitrogen/Sabre-Lite boards(I.MX6 processor).
>
>     http://git.buildroot.net/buildroot/commit/?id=913b916567231aedb34c4a616519f607eb90e616
>
> When I built this - the associated Kernel uImage was HUGE (60Meg)?

  Something funny going on there...  I built the current master with the
nitrogen6x_defconfig and the uImage is only 3.7M.

  Maybe check the linux config, did it accidentally turn into an allyesconfig?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
