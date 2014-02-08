From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  8 Feb 2014 17:04:02 +0100
Subject: [Buildroot] [PATCH 1/4] manual: $(BR2_EXTERNAL)/{Config.in,
	external.mk} are mandatory
In-Reply-To: <cover.1391875274.git.yann.morin.1998@free.fr>
References: <cover.1391875274.git.yann.morin.1998@free.fr>
Message-ID: <bcd0434786c4e0a874036a9b49825f62d44291fd.1391875274.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The manual is a bit vague about whether Config.in and external.mk
are mandatory or optional.

Make it explicit in the manual that they are mandatory.

Reported-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/customize-outside-br.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 19257e6..585eedf 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -83,6 +83,7 @@ Or disable the usage of external definitions:
    logic. Buildroot automatically includes +BR2_EXTERNAL/Config.in+ to
    make it appear in the top-level configuration menu, and includes
    +BR2_EXTERNAL/external.mk+ with the rest of the makefile logic.
+   Providing those two files is mandatory, but they can be empty.
 +
 The main usage of this is to store package recipes. The recommended
    way to do this is to write a +BR2_EXTERNAL/Config.in+ that looks
-- 
1.8.1.2
