From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 04 Nov 2012 00:39:20 +0100
Subject: [Buildroot] [PATCH 03/18] toolchain-crosstool-ng: use the
 Crosstool-ng config options instead of the common hidden ones
In-Reply-To: <cfe1f812fb80ad1cdbd18ea18cf08e0557773d96.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <cfe1f812fb80ad1cdbd18ea18cf08e0557773d96.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5095AB28.8040102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/12 18:47, Thomas Petazzoni wrote:
> Since we are some day going to finally rename the badly named common
> toolchain options (BR2_USE_WCHAR, BR2_ENABLE_LOCALE, BR2_INET_RPC,
> etc.) into something more logical, let's start using the Crosstool-NG
> toolchain options in the Crosstool-NG code.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> Reviewed-by: Yann E. MORIN<yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
