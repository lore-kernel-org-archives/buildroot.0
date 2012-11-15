From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Nov 2012 12:36:35 +0100
Subject: [Buildroot] [PATCH 1/5] lua-msgpack-native: new package v2
In-Reply-To: <1346741921-28968-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Tue, 4 Sep 2012 08:58:37 +0200")
References: <1346741921-28968-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87390b5c8s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 Francois> Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
 Francois> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 Francois> ---
 Francois>  package/Config.in                                |    1 +
 Francois>  package/lua-msgpack-native/Config.in             |    7 ++++++
 Francois>  package/lua-msgpack-native/lua-msgpack-native.mk |   29 ++++++++++++++++++++++
 Francois>  3 files changed, 37 insertions(+)
 Francois>  create mode 100644 package/lua-msgpack-native/Config.in
 Francois>  create mode 100644 package/lua-msgpack-native/lua-msgpack-native.mk

 Francois> diff --git a/package/Config.in b/package/Config.in
 Francois> index f308de7..f05f5f4 100644
 Francois> --- a/package/Config.in
 Francois> +++ b/package/Config.in
 Francois> @@ -257,6 +257,7 @@ source "package/luacjson/Config.in"
 Francois>  source "package/luaexpat/Config.in"
 Francois>  source "package/luafilesystem/Config.in"
 Francois>  source "package/luasocket/Config.in"
 Francois> +source "package/lua-msgpack-native/Config.in"
 Francois>  source "package/rings/Config.in"
 Francois>  source "package/wsapi/Config.in"
 Francois>  source "package/xavante/Config.in"
 Francois> diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
 Francois> new file mode 100644
 Francois> index 0000000..90eecc3
 Francois> --- /dev/null
 Francois> +++ b/package/lua-msgpack-native/Config.in
 Francois> @@ -0,0 +1,7 @@
 Francois> +config BR2_PACKAGE_LUA_MSGPACK_NATIVE
 Francois> +	bool "lua-msgpack-native"
 Francois> +	help
 Francois> +	  This is a native, C language implementation of msgpack (http://msgpack.org)

This doesn't fit in the normal 80-col menuconfig window. I've
reformatted it and committed, thanks.

-- 
Bye, Peter Korsgaard
