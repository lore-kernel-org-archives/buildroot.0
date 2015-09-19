From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 14:17:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/lua-periphery: bump to version
 1.0.6
In-Reply-To: <1442270435-28287-1-git-send-email-joerg.krause@embedded.rocks>
References: <1442270435-28287-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150919141752.55224e4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue, 15 Sep 2015 00:40:35 +0200, J?rg Krause wrote:
> Also remove patch 0001-fix-build-flags.patch. The uCLibc issue is fixed
> upstream.
> 
> Add patch taken and slighly adopted from the c-periphery package to fix build
> issue with musl.
> 
> Build was tested with an uCLibc toolchain and a musl toolchain.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...Add-missing-header-for-musl-compatibility.patch | 34 ++++++++++++++++++++++
>  package/lua-periphery/0001-fix-build-flags.patch   | 21 -------------
>  package/lua-periphery/lua-periphery.hash           |  2 +-
>  package/lua-periphery/lua-periphery.mk             |  4 +--
>  4 files changed, 37 insertions(+), 24 deletions(-)
>  create mode 100644 package/lua-periphery/0001-Add-missing-header-for-musl-compatibility.patch
>  delete mode 100644 package/lua-periphery/0001-fix-build-flags.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
