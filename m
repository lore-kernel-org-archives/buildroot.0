From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 04 Nov 2012 00:32:02 +0100
Subject: [Buildroot] [PATCH 01/18] uClibc: use the Buildroot toolchain
 options instead of the hidden common options
In-Reply-To: <1849f29646ff6a451e17700961f988cb38e4e3a4.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <1849f29646ff6a451e17700961f988cb38e4e3a4.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5095A972.7050603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/12 18:47, Thomas Petazzoni wrote:
> Since we are some day going to finally rename the badly named common
> toolchain options (BR2_USE_WCHAR, BR2_ENABLE_LOCALE, BR2_INET_RPC,
> etc.) into something more logical, let's start using the Buildroot
> toolchain options in the uClibc code.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
