From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Aug 2012 19:51:44 +0200
Subject: [Buildroot] [PATCH 06/20] busybox: add support to link against
 libtirpc when available
In-Reply-To: <201208121751.09062.yann.morin.1998@free.fr>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <982e7938fd23732ce642ef91ecdc26b0f073b4c7.1344706801.git.thomas.petazzoni@free-electrons.com>
 <201208121751.09062.yann.morin.1998@free.fr>
Message-ID: <503D0530.1080708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/12/12 17:51, Yann E. MORIN wrote:
> On Saturday 11 August 2012 19:40:38 Thomas Petazzoni wrote:
> >    # If RPC is enabled then enable nfs mounts
> >  -ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),y)
> >  +ifeq ($(BR2_RPC_AVAILABLE),y)
> BR2_RPC_SUPPORT_AVAILABLE


  But maybe BR2_RPC_AVAILABLE is a better name :-)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
