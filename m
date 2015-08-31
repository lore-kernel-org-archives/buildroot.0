From: Scott Fan <fancp2007@gmail.com>
Date: Mon, 31 Aug 2015 20:59:03 +0800
Subject: [Buildroot] [PATCH v3 0/2] Add package 'remmina' and 'libssh'
Message-ID: <1441025945-4689-1-git-send-email-fancp2007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remmina is a remote desktop client written in GTK+, which currently
support RDP, VNC, NX, XDMCP and SSH.

Libssh is a multiplatform C library implementing the SSHv2 and SSHv1
protocol on client and server side.

Remmina package depends on package libssh, NOT the libssh2 package.


Changes v2 -> v3:
1) pick the first patch 'libssh' from the 'next' tree.
2) fix the dependencies of package remmina.

Changes v1 -> v2:
1) fix the dependencies of package remmina.
2) fix the license of package remmina.
3) wrap lines at 72 characters.

Scott Fan (2):
  libssh: new package
  Remmina: new package

 package/Config.in          |  2 ++
 package/libssh/Config.in   | 11 +++++++++++
 package/libssh/libssh.hash |  4 ++++
 package/libssh/libssh.mk   | 36 ++++++++++++++++++++++++++++++++++++
 package/remmina/Config.in  | 28 ++++++++++++++++++++++++++++
 package/remmina/remmina.mk | 34 ++++++++++++++++++++++++++++++++++
 6 files changed, 115 insertions(+)
 create mode 100644 package/libssh/Config.in
 create mode 100644 package/libssh/libssh.hash
 create mode 100644 package/libssh/libssh.mk
 create mode 100644 package/remmina/Config.in
 create mode 100644 package/remmina/remmina.mk

-- 
2.5.1
