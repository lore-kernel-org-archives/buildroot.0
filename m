From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 21:31:46 +0200
Subject: [Buildroot] [PATCH] lua: bump to version 5.3.3
In-Reply-To: <1465316955-26808-1-git-send-email-francois.perrad@gadz.org>
References: <1465316955-26808-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160607213146.65327430@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Jun 2016 18:29:15 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua/{5.3.2 => 5.3.3}/0001-root-path.patch           | 0
>  package/lua/{5.3.2 => 5.3.3}/0002-shared-libs-for-lua.patch | 0
>  package/lua/{5.3.2 => 5.3.3}/0004-lua-pc.patch              | 4 ++--
>  package/lua/{5.3.2 => 5.3.3}/0011-linenoise.patch           | 0
>  package/lua/lua.hash                                        | 4 ++--
>  package/lua/lua.mk                                          | 2 +-
>  6 files changed, 5 insertions(+), 5 deletions(-)
>  rename package/lua/{5.3.2 => 5.3.3}/0001-root-path.patch (100%)
>  rename package/lua/{5.3.2 => 5.3.3}/0002-shared-libs-for-lua.patch (100%)
>  rename package/lua/{5.3.2 => 5.3.3}/0004-lua-pc.patch (97%)
>  rename package/lua/{5.3.2 => 5.3.3}/0011-linenoise.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
