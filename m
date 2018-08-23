From: Brad Love <brad@nextdimension.cc>
Date: Thu, 23 Aug 2018 14:56:25 -0500
Subject: [Buildroot] [PATCH 0/2] i2c-tools: license and staging installation
 fixes
Message-ID: <1535054187-6055-1-git-send-email-brad@nextdimension.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 1/2 updates i2c-tools.mk to include the LGPL-2.1+ license which
applies to the library libi2c.

Patch 2/2 enables staging installation, using make targets to install
the header and dynamic or static library for use by external packages.


Brad Love (2):
  i2c-tools: include LGPL-2.1+ license for libi2c
  i2c-tools: install library and header to staging

 package/i2c-tools/i2c-tools.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.7.4
