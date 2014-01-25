From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 25 Jan 2014 15:51:13 +0100
Subject: [Buildroot] [PATCH 0/2] lua: fix compilation with Blackfin FLAT
Message-ID: <1390661475-23218-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This set supercedes http://patchwork.ozlabs.org/patch/313208/

Francois Perrad (2):
  lua: refactor install steps
  lua: handles BR2_PREFER_STATIC_LIB

 package/Config.in                                  |    2 +-
 package/lua/5.1.5/lua-02-shared-libs-for-lua.patch |   42 ++++++++++++--
 package/lua/5.2.3/lua-02-shared-libs-for-lua.patch |   42 ++++++++++++--
 package/lua/lua.mk                                 |   58 ++++++--------------
 4 files changed, 91 insertions(+), 53 deletions(-)

-- 
1.7.9.5
