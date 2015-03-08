From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 14:36:17 +0100
Subject: [Buildroot] [PATCH] lua: bump to version 5.2.4
In-Reply-To: <1425812176-2184-1-git-send-email-francois.perrad@gadz.org>
References: <1425812176-2184-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150308143617.1ae6afed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sun,  8 Mar 2015 11:56:16 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua/5.2.3/0012-fix-ephemeron-table.patch      | 19 -------------------
>  package/lua/{5.2.3 => 5.2.4}/0001-root-path.patch     |  0
>  .../{5.2.3 => 5.2.4}/0002-shared-libs-for-lua.patch   |  0
>  package/lua/{5.2.3 => 5.2.4}/0004-lua-pc.patch        |  0
>  package/lua/{5.2.3 => 5.2.4}/0011-linenoise.patch     |  0
>  package/lua/lua.hash                                  |  4 ++--
>  package/lua/lua.mk                                    |  2 +-
>  7 files changed, 3 insertions(+), 22 deletions(-)
>  delete mode 100644 package/lua/5.2.3/0012-fix-ephemeron-table.patch
>  rename package/lua/{5.2.3 => 5.2.4}/0001-root-path.patch (100%)
>  rename package/lua/{5.2.3 => 5.2.4}/0002-shared-libs-for-lua.patch (100%)
>  rename package/lua/{5.2.3 => 5.2.4}/0004-lua-pc.patch (100%)
>  rename package/lua/{5.2.3 => 5.2.4}/0011-linenoise.patch (100%)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
