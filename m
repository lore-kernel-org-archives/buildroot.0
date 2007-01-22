From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 22 Jan 2007 09:55:32 +0100
Subject: [Buildroot] Dialog 404
In-Reply-To: <200701220819.37937.alexander.rigbo@acgnystrom.se>
References: <200701220819.37937.alexander.rigbo@acgnystrom.se>
Message-ID: <20070122085532.GB32170@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 22, 2007 at 08:19:37AM +0100, Alexander Rigbo wrote:
>Hi,
>
>A patch version has changed and the old one has been removed, patch: 
>
>um-dev [br] $ diff -ruN meep/package/dialog/dialog.mk 
>buildroot/package/dialog/dialog.mk
>--- meep/package/dialog/dialog.mk       2007-01-15 15:36:09.000000000 +0100
>+++ buildroot/package/dialog/dialog.mk  2007-01-15 09:15:20.000000000 +0100
>@@ -9,7 +9,7 @@
> DIALOG_SITE:=http://ftp.debian.org/debian/pool/main/d/dialog
> DIALOG_DIR:=$(BUILD_DIR)/dialog-$(DIALOG_VERSION)
> # 
>http://ftp.debian.org/debian/pool/main/d/dialog/dialog_1.0-20050306-1.diff.gz
>-DIALOG_PATCH1:=dialog_$(DIALOG_VERSION)-2.diff.gz
>+DIALOG_PATCH1:=dialog_$(DIALOG_VERSION)-1.diff.gz
> DIALOG_PATCH1_URL:=$(DIALOG_SITE)
> DIALOG_BINARY:=dialog
> DIALOG_TARGET_BINARY:=usr/bin/dialog
>
>Sorry about the patch format :)

That patch was reversed, but thanks for pointing this out.
