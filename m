From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:47:49 +0200
Subject: [Buildroot] [git commit] erlang-lager: add explicit dependencies
	for host variant
Message-ID: <20160703064824.968A181D8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2c0d12d2544f548d05ce8ac1666657d1d85a9ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-lager/erlang-lager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
index 19940a9..b55b6f7 100644
--- a/package/erlang-lager/erlang-lager.mk
+++ b/package/erlang-lager/erlang-lager.mk
@@ -9,6 +9,7 @@ ERLANG_LAGER_SITE = $(call github,basho,lager,$(ERLANG_LAGER_VERSION))
 ERLANG_LAGER_LICENSE = Apache-2.0
 ERLANG_LAGER_LICENSE_FILES = LICENSE
 ERLANG_LAGER_DEPENDENCIES = erlang-goldrush
+HOST_ERLANG_LAGER_DEPENDENCIES = host-erlang-goldrush
 
 $(eval $(rebar-package))
 $(eval $(host-rebar-package))
