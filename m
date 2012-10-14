From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Oct 2012 18:01:46 +0200
Subject: [Buildroot] [PATCH 1/3] New top-level directory: system
In-Reply-To: <d1e6b9d55b385bee2d698c950a610d52fffd2d95.1348468443.git.thomas.petazzoni@free-electrons.com>
References: <cover.1348468443.git.thomas.petazzoni@free-electrons.com>
 <d1e6b9d55b385bee2d698c950a610d52fffd2d95.1348468443.git.thomas.petazzoni@free-electrons.com>
Message-ID: <507AE1EA.2070608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/09/12 08:34, Thomas Petazzoni wrote:
> This directory groups the following elements:
>   * the default root filesystem skeleton
>   * the default device tables
>   * the Config.in options for system configuration (UART port for
>     getty, system hostname, etc.)
>   * the make rules to apply the system configuration options
>
> Even though the skeleton and device tables could have lived in fs/, it
> would have been strange to have the UART, system hostname and other
> related options into fs/. A new system/ directory makes more sense.
>
> As a consequence, this patch also removes target/Makefile.in, which
> has become useless in the process.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> Acked-by: Yann E. MORIN<yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Since nobody has opposed this, and since the problem Yann saw didn't
really exist (right?), I think this one can be applied right away.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
