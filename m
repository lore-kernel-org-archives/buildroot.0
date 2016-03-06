From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2016 00:07:50 +0100
Subject: [Buildroot] [PATCH 1/3] package/libcap: install .pc file
 unconditionally
In-Reply-To: <347ad80ae1c4e2168f2ae458999f25bc5f66245f.1457305443.git.yann.morin.1998@free.fr>
References: <cover.1457305443.git.yann.morin.1998@free.fr>
 <347ad80ae1c4e2168f2ae458999f25bc5f66245f.1457305443.git.yann.morin.1998@free.fr>
Message-ID: <20160307000750.5fd24d8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  7 Mar 2016 00:04:54 +0100, Yann E. MORIN wrote:
> And re-format patches as git patches.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/c13/c13fb87c2e4739106e256f34fff93696b0133bf6/
>     http://autobuild.buildroot.org/results/f82/f822801f9b811e1a0fb4627f6b528116375cacfe/
>     http://autobuild.buildroot.org/results/07c/07c0315a35089a8d3e8eb1a305dcd8bf1fb882ee/
>     and many more...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  ...build-system-fixes-for-cross-compilation.patch} | 47 +++++++++++++---------
>  ...-install-into-install-shared-install-sta.patch} | 26 ++++++++++--
>  package/libcap/libcap.mk                           |  2 +-
>  3 files changed, 52 insertions(+), 23 deletions(-)
>  rename package/libcap/{0001-build-system.patch => 0001-build-system-fixes-for-cross-compilation.patch} (69%)
>  rename package/libcap/{0002-split-static-shared-install.patch => 0002-libcap-split-install-into-install-shared-install-sta.patch} (52%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
