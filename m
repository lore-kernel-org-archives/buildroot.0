From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 04 Nov 2012 00:42:48 +0100
Subject: [Buildroot] [PATCH 04/18] Rename BR2_INET_RPC to
	BR2_TOOLCHAIN_HAS_NATIVE_RPC
In-Reply-To: <df263474cae4ecb6cf8100906a8093bf2dab2c29.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <df263474cae4ecb6cf8100906a8093bf2dab2c29.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5095ABF8.6060307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/12 18:47, Thomas Petazzoni wrote:
> The BR2_INET_RPC has for a long time been a not very descriptive
> configuration option name, and with the advent of non-RPC glibc
> toolchains and the apparition of libtirpc, we really need to rename it
> to something more sensible, BR2_TOOLCHAIN_HAS_NATIVE_RPC.
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
