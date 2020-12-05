From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 22:44:31 +0100
Subject: [Buildroot] [PATCH] package/lua: bump to version 5.4.2
In-Reply-To: <20201203173640.40288-1-francois.perrad@gadz.org>
References: <20201203173640.40288-1-francois.perrad@gadz.org>
Message-ID: <20201205224431.1b1c6b3a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Dec 2020 18:36:40 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua/5.4.1/lua.hash                                  | 6 ------
>  package/lua/{5.4.1 => 5.4.2}/0001-root-path.patch           | 2 +-
>  package/lua/{5.4.1 => 5.4.2}/0002-shared-libs-for-lua.patch | 0
>  package/lua/{5.4.1 => 5.4.2}/0011-linenoise.patch           | 0
>  package/lua/5.4.2/lua.hash                                  | 6 ++++++
>  package/lua/lua.mk                                          | 4 ++--
>  6 files changed, 9 insertions(+), 9 deletions(-)
>  delete mode 100644 package/lua/5.4.1/lua.hash
>  rename package/lua/{5.4.1 => 5.4.2}/0001-root-path.patch (95%)
>  rename package/lua/{5.4.1 => 5.4.2}/0002-shared-libs-for-lua.patch (100%)
>  rename package/lua/{5.4.1 => 5.4.2}/0011-linenoise.patch (100%)
>  create mode 100644 package/lua/5.4.2/lua.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
