From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 31 May 2014 11:29:50 +0200
Subject: [Buildroot] [PATCH] manual: fix spelling mistakes
In-Reply-To: <1401524780-5128-1-git-send-email-spdawson@gmail.com>
References: <1401524780-5128-1-git-send-email-spdawson@gmail.com>
Message-ID: <e7f92132-1c41-46b9-818b-f6e14eedc722@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon Dawson <spdawson@gmail.com> schreef:
>Signed-off-by: Simon Dawson <spdawson@gmail.com>
>---
> docs/manual/adding-packages-directory.txt   | 2 +-
> docs/manual/adding-packages-luarocks.txt    | 4 ++--
> docs/manual/adding-packages-virtual.txt     | 2 +-
> docs/manual/configure.txt                   | 6 +++---
> docs/manual/make-tips.txt                   | 2 +-
> docs/manual/using-buildroot-development.txt | 2 +-
> 6 files changed, 9 insertions(+), 9 deletions(-)
>
>diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
>index 3cf3afa..f735244 100644
>--- a/docs/manual/adding-packages-directory.txt
>+++ b/docs/manual/adding-packages-directory.txt
>@@ -27,7 +27,7 @@ config BR2_PACKAGE_LIBFOO
> 	  http://foosoftware.org/libfoo/
> ---------------------------
> 
>-The +bool+ line, +help+ line and other meta-informations about the
>+The +bool+ line, +help+ line and other meta-information about the
> configuration option must be indented with one tab. The help text
> itself should be indented with one tab and two spaces, and it must
> mention the upstream URL of the project.
>diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
>index 766a4fe..f307e4d 100644
>--- a/docs/manual/adding-packages-luarocks.txt
>+++ b/docs/manual/adding-packages-luarocks.txt
>@@ -49,7 +49,7 @@ package to be built.
> ==== +luarocks-package+ reference
> 
> LuaRocks is a deployment and management system for Lua modules, and supports
>-various +build.type+: +builtin+, +make+ and +cmake+. In the contetx of
>+various +build.type+: +builtin+, +make+ and +cmake+. In the context of
> Buildroot, the +luarocks-package+ infrastructure only supports the +builtin+
> mode. LuaRocks packages that use the +make+ or +cmake+ build mechanisms
> should instead be packaged using the +generic-package+ and +cmake-package+
>@@ -57,7 +57,7 @@ infrastructures in Buildroot, respectively.
> 
> The main macro of the LuaRocks package infrastructure is +luarocks-package+:
> like +generic-package+ it works by defining a number of variables providing
>-meta informations about the package, and then calling +luarocks-package+. It
>+meta information about the package, and then calling +luarocks-package+. It
> is worth mentioning that building LuaRocks packages for the host is not
> supported, so the macro +host-luarocks-package+ is not implemented.

Previously in this patch, meta information was written with hyphen. Which is the correct spelling?

Thanks,
Thomas
