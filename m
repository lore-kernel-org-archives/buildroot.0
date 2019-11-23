From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Nov 2019 19:23:35 +0100
Subject: [Buildroot] [git commit] package/perl: add license hash
Message-ID: <20191123181739.3CF058FA6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9465182eb8b6bf165ecba849613f23164cd17427
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl/perl.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 4604d2715d..c988ab752f 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -5,3 +5,8 @@ sha256 0b0189bfa4b2da20e899b4bdd746ac402e8f746a58e4fcf5516484157f2aab07 perl-5.2
 
 # Hashes from: https://github.com/arsv/perl-cross/releases/download/1.2.3/perl-cross-1.2.3.hash
 sha256 84583a1bb5f3a2c64d13d031386c114382e5c62955c6f84a27cec8318536627c perl-cross-1.2.3.tar.gz
+
+# Locally calculated
+sha256 dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2 Artistic
+sha256 d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912 Copying
+sha256 4a39adc445d79e213df5c2028c5432806dfcdfe69a5bc31ba5c83071a0097877 README
