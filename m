From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 06 Aug 2014 07:38:08 +0200
Subject: [Buildroot] [PATCH 1/1] manual: fix copy/paste error in
	python	package example
In-Reply-To: <1407292912-2003-1-git-send-email-danomimanchego123@gmail.com>
References: <1407292912-2003-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <3dcc9e93-eab8-4301-99cb-35694dc829e9@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi Manchego <danomimanchego123@gmail.com> schreef:
>The SOURCE references "LIBFOO_VERSION", should be "PYTHON_FOO_VERSION".
>
>Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>---
> docs/manual/adding-packages-python.txt |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
>index c4a13e0..46d140d 100644
>--- a/docs/manual/adding-packages-python.txt
>+++ b/docs/manual/adding-packages-python.txt
>@@ -22,7 +22,7 @@ with an example :
> 05: ################################################################################
> 06:
> 07: PYTHON_FOO_VERSION = 1.0
>-08: PYTHON_FOO_SOURCE = python-foo-$(LIBFOO_VERSION).tar.xz
>+08: PYTHON_FOO_SOURCE = python-foo-$(PYTHON_FOO_VERSION).tar.xz
> 09: PYTHON_FOO_SITE = http://www.foosoftware.org/download
> 10: PYTHON_FOO_LICENSE = BSD-3c
> 11: PYTHON_FOO_LICENSE_FILES = LICENSE

Acked-by: Thomas De Schampheleire < thomas.de.schampheleire@gmail.com>
