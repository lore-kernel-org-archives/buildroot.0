From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Jan 2013 08:52:53 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <b0d70289993ab5426e1c411b1fc102c7a8022b5d.1359498504.git.yann.morin.1998@free.fr>
References: <cover.1359498504.git.yann.morin.1998@free.fr>
 <b0d70289993ab5426e1c411b1fc102c7a8022b5d.1359498504.git.yann.morin.1998@free.fr>
Message-ID: <5108D155.3060208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/01/13 23:33, Yann E. MORIN wrote:
> pmake is the make command used by the BSD.
> It will used to build BSD-related packages, coming later.
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> ---
>   package/pmake/pmake-100_mk.patch         | 2624 ++++++++++++++++++++++++++++++
>   package/pmake/pmake-110_mkdep.patch      |  230 +++
>   package/pmake/pmake-120_fixes.patch      |  266 +++
>   package/pmake/pmake-130_maxpathlen.patch |   39 +
>   package/pmake/pmake-140_multiarch.patch  |  354 ++++
>   package/pmake/pmake-150_mktemp.patch     |   31 +

  Can't these patches be downloaded with PMAKE_PATCH?

  Regards,
  Arnout

>   package/pmake/pmake.mk                   |   46 +


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
