From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 20 Sep 2018 18:59:11 +0200
Subject: [Buildroot] [PATCH v3 0/2] at: bump version
In-Reply-To: <20180918213949.36376-1-giulio.benetti@micronovasrl.com>
References: <20180918213949.36376-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180920165913.13488-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested at https://elinux.org/Buildroot#Todo_list:
"Update the at package to use the upstream.
http://anonscm.debian.org/gitweb/?p=collab-maint/at.git;a=summary"
In the meanwhile that site became unreachable and the at upstream now is:
https://salsa.debian.org/debian/at

These are the basic tasks done:
- change upstream site, bump version
- add sha256 for legal-info files
- improved S99at init.d script to have live session working
  (/var/spool linked to /tmp) and warn about it

Giulio Benetti (2):
  at: change upstream site, bump version
  at: add sha256 for legal-info files

 package/at/Config.in | 2 ++
 package/at/S99at     | 9 +++++++++
 package/at/at.hash   | 7 +++++--
 package/at/at.mk     | 9 +++++----
 4 files changed, 21 insertions(+), 6 deletions(-)

-- 
2.17.1
