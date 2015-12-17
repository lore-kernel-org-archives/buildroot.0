From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 21:58:20 +0100
Subject: [Buildroot] [V2] lua: bump to version 5.3.2
In-Reply-To: <1448997614-13707-1-git-send-email-francois.perrad@gadz.org>
References: <1448997614-13707-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20151217215820.0a951edd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Tue,  1 Dec 2015 20:20:14 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua/{5.3.1 => 5.3.2}/0001-root-path.patch           | 0
>  package/lua/{5.3.1 => 5.3.2}/0002-shared-libs-for-lua.patch | 0
>  package/lua/{5.3.1 => 5.3.2}/0004-lua-pc.patch              | 2 +-
>  package/lua/{5.3.1 => 5.3.2}/0011-linenoise.patch           | 6 ++----
>  package/lua/lua.hash                                        | 4 ++--
>  package/lua/lua.mk                                          | 2 +-
>  6 files changed, 7 insertions(+), 9 deletions(-)
>  rename package/lua/{5.3.1 => 5.3.2}/0001-root-path.patch (100%)
>  rename package/lua/{5.3.1 => 5.3.2}/0002-shared-libs-for-lua.patch (100%)
>  rename package/lua/{5.3.1 => 5.3.2}/0004-lua-pc.patch (97%)
>  rename package/lua/{5.3.1 => 5.3.2}/0011-linenoise.patch (78%)

Applied, thanks. BTW, Lua 5.1 is still the default version used in
Buildroot. Isn't it time to switch to 5.2 or 5.3 as the default version?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
