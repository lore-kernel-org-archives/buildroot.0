From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 May 2015 22:44:04 +0200
Subject: [Buildroot] [git commit] toolchain-external: add hashes for musl
	toolchains
Message-ID: <20150501205228.E60BC7F89E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a8e1292097124ed766ce4843ab7c47797a26044
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hashes for all musl toolchains, including the ones that we
currently don't support (arm hf, sh4, x86_64-x32).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external/toolchain-external.hash     |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 7362b81..444ddfd 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -60,3 +60,17 @@ sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu
 sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
 sha256 aaaf6facd1f60a3cd2a537154ea39cd7d70501c175e30e01a97e8df6cb8226c7  arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
 sha256 30711c5f15762764d4cd5ec1e6ced5b1fddd03aac41c424b0c4ec8a45d5d79cd  arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
+
+# Prebuilt musl toolchains from musl-cross
+sha256 26da90f5cf5e5220b1d6424420ab9f3877a1826a2a5268a62d390711c0e73cd0  crossx86-arm-linux-musleabi-1.1.6.tar.xz
+sha256 c3b1c79a48e999c8f655cd008d04ba53c4f76217fa3c289566dab174e8ef8711  crossx86-arm-linux-musleabihf-1.1.6.tar.xz
+sha256 b74ebf6e92b69bb7c7651cc8ff87a14c41fd9c043af9db7304b293c291c830b5  crossx86-armeb-linux-musleabi-1.1.6.tar.xz
+sha256 740716209e1aef0442fe8e200a1b2582d9d86e86ff6d113ab9678b592121e2f9  crossx86-i486-linux-musl-1.1.6.tar.xz
+sha256 7a0da8bd22c25ad11acc8309d8541b7b7966ccefcf136d860d38bf625c05b53e  crossx86-microblaze-linux-musl-1.1.6.tar.xz
+sha256 b89503aeb02a5201476ff4bb014879f1989868c9c25f2af84e2fc04bec7acf2e  crossx86-mips-linux-musl-1.1.6.tar.xz
+sha256 552996f7a8132f8be994513156a30f4c03fff4873b76726b98e4e0056257367f  crossx86-mipsel-linux-musl-1.1.6.tar.xz
+sha256 c49f7425ac9d0629cd9893d7bc247d5e6847c9eb5d11924dbc440b9d10f6c2bb  crossx86-powerpc-linux-musl-1.1.6.tar.xz
+sha256 79a1a4be93e2a63acb137170e98bdfbf744bd9ca7b15b76ab512d1e0dfec834e  crossx86-sh4-linux-musl-1.1.6.tar.xz
+sha256 aec4d560dc601e397fc86a9759166005afba22ad666d1a48019b5102c534ccc1  crossx86-sh4eb-linux-musl-1.1.6.tar.xz
+sha256 68eda0795aacd4371b45a6c58c5c75e86c0c2fdf7ebc2c0b7d3752462c848260  crossx86-x86_64-linux-musl-1.1.6.tar.xz
+sha256 6bef5ee2cdb9fa35e49ce0a270f6d7c48f3268c6f6345ad5ca0b8137982b4690  crossx86-x86_64-x32-linux-musl-1.1.6.tar.xz
