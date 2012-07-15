From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 13:44:14 +0200
Subject: [Buildroot] [PATCH 5 of 6 resend] toolchain-external: allow
 downloading a custom toolchain
In-Reply-To: <e1ec959a929032d75c76.1340343758@beantl019720>
References: <patchbomb.1340343753@beantl019720>
 <e1ec959a929032d75c76.1340343758@beantl019720>
Message-ID: <5002AD0E.7050804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/12 07:42, Thomas De Schampheleire wrote:
> This patch adds the possibility to download a custom external
> toolchain, in addition to the existing support of preinstalled custom
> external toolchains.
>
> With the modified configuration, the user is presented with the
> following options:
> - Toolchain type: Buildroot toolchain | External toolchain | Ct-ng toolchain
>
> In case of External toolchain:
> - Toolchain: the CodeSourcery toolchains | Custom toolchain
> - Toolchain origin: Toolchain to be downloaded and installed | Pre-installed toolchain
>
> In case of Toolchain to be downloaded, the user is presented with:
> - Toolchain URL
> In case of Pre-installed toolchain, the users sees:
> - Toolchain Path
>
> For CodeSourcery toolchains, the toolchain URL field is not used (the
> URLs are directly coded in ext-tool.mk).
>
>
> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  And a bump.

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
