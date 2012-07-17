From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 23:32:27 +0200
Subject: [Buildroot] [PATCH] New package: LuaExpat [v2]
In-Reply-To: <1342407566-2819-2-git-send-email-danomimanchego123@gmail.com>
References: <1342407566-2819-1-git-send-email-danomimanchego123@gmail.com>
 <1342407566-2819-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20120717233227.65485f46@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 15 Jul 2012 22:59:26 -0400,
Danomi Manchego <danomimanchego123@gmail.com> a ?crit :

> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/Config.in            |    1 +
>  package/luaexpat/Config.in   |    7 +++++++
>  package/luaexpat/luaexpat.mk |   39 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)
>  create mode 100644 package/luaexpat/Config.in
>  create mode 100644 package/luaexpat/luaexpat.mk

Applied, thanks.

I have just done a few things: remove useless quotes in
LUAEXPAT_UNINSTALL_TARGET_CMDS, use the generic-package macro.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
