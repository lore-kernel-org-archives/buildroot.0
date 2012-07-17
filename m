From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 23:33:08 +0200
Subject: [Buildroot] [PATCH] New package: lua-cjson [v2]
In-Reply-To: <1342407627-2861-2-git-send-email-danomimanchego123@gmail.com>
References: <1342407627-2861-1-git-send-email-danomimanchego123@gmail.com>
 <1342407627-2861-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20120717233308.67894649@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 15 Jul 2012 23:00:27 -0400,
Danomi Manchego <danomimanchego123@gmail.com> a ?crit :

> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/Config.in              |    1 +
>  package/lua-cjson/Config.in    |   13 +++++++++++++
>  package/lua-cjson/lua-cjson.mk |   32 ++++++++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+)
>  create mode 100644 package/lua-cjson/Config.in
>  create mode 100644 package/lua-cjson/lua-cjson.mk

Applied, thanks.

I have renamed the package to just luacjson, for consistency with other
lua* modules. I've also removed useless quotes in
LUA_CJSON_UNINSTALL_TARGET_CMDS, and used the new generic-package macro
instead of GENTARGETS.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
