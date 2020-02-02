From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Feb 2020 09:54:37 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-xmpp: fix host build
Message-ID: <20200202084348.530B17FE6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=307fd6f517f1a4e64846f3a76c624aac8e6eacd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/3e594350131994df53b20d5113fefbba2e747836

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
index ced058731b..2f74c60df2 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
@@ -11,6 +11,7 @@ ERLANG_P1_XMPP_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_XMPP_INSTALL_STAGING = YES
 ERLANG_P1_XMPP_DEPENDENCIES = erlang-p1-xml erlang-p1-stringprep \
 	erlang-p1-tls erlang-p1-utils erlang-p1-zlib host-erlang-p1-xml
+HOST_ERLANG_P1_XMPP_DEPENDENCIES = host-erlang-p1-xml
 
 $(eval $(rebar-package))
 $(eval $(host-rebar-package))
