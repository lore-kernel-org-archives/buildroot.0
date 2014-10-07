From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 21:04:20 +0200
Subject: [Buildroot] [git commit] openssh: mention release announcement in
	hash file
Message-ID: <20141007190535.E8930B0EE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3227f30c5bdea0e4aa147134ccfab282cc438328
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, add sha1 hash from the announcement.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 0b57d48..2fcdabe 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
+# Also from http://www.openssh.com/txt/release-6.7 (sha256 is base64 encoded)
+sha1	14e5fbed710ade334d65925e080d1aaeb9c85bf6	openssh-6.7p1.tar.gz
 sha256	b2f8394eae858dabbdef7dac10b99aec00c95462753e80342e530bbb6f725507	openssh-6.7p1.tar.gz
