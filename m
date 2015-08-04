From: Denis THULIN <denis.thulin@openwide.fr>
Date: Tue,  4 Aug 2015 14:27:05 +0200
Subject: [Buildroot] [PATCH 0/2] pkg-kconfig now loads kconfig variables
Message-ID: <1438691227-23379-1-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds a way to use the configurations of kconfig packages in the
buildroot make environnement.
This can be useful when you want to be sure that an option of a kconfig
package is selected or when you want to know some information about
a kconfig package's configuration

The first patch of the series is the modification of pkg-kconfig to make
that change.

The second patch is an exemple of how this can be used.


Denis THULIN (2):
  kconfig: Can now use variables outside of package
  i2c-tools: Adds check of i2c kernel option

 Makefile                       |  4 +++-
 package/i2c-tools/i2c-tools.mk | 14 ++++++++++++++
 package/pkg-kconfig.mk         | 24 +++++++++++++++++++++++-
 3 files changed, 40 insertions(+), 2 deletions(-)

-- 
2.5.0
