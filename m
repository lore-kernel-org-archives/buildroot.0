From: Brad Love <brad@nextdimension.cc>
Date: Fri, 24 Aug 2018 08:54:05 -0500
Subject: [Buildroot] [PATCH v3 0/2] i2c-tools: license and staging
 installation fixes
Message-ID: <1535118847-21086-1-git-send-email-brad@nextdimension.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 1/2 updates i2c-tools.mk to include the LGPL-2.1+ license which
applies to the library libi2c.

Patch 2/2 enables staging installation, using make targets to install
the header and dynamic or static library for use by external packages.

since v2:
- Added COPYING.LGPL and README to license files
- Expand commit message for newly included files
- Regen patch 2/2

since v1:
- condensed make install-lib and make install-include to make install
- Updated commit message
- fixed patch typo (library to libi2c)

 
Brad Love (2):
  i2c-tools: include LGPL-2.1+ license for libi2c
  i2c-tools: install library and header to staging

 package/i2c-tools/i2c-tools.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.7.4
