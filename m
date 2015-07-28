From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 28 Jul 2015 21:17:57 +0800
Subject: [Buildroot] [PATCH v2 0/2] Add package 'remmina' and 'libssh'
Message-ID: <1438089479-30678-1-git-send-email-fancp2007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remmina is a remote desktop client written in GTK+, which currently
support RDP, VNC, NX, XDMCP and SSH.

Libssh is a mulitplatform C library implementing the SSHv2 and SSHv1
protocol on client and server side.

Remmina package depends on package libssh, NOT the libssh2 package.

This changeset:
1) fix the dependencies of package remmina.
2) fix the license of package remmina.
3) wrap lines at 72 characters.


Scott Fan (2):
  libssh: new package
  Remmina: new package

 package/Config.in          |  2 ++
 package/libssh/Config.in   |  9 +++++++++
 package/libssh/libssh.hash |  2 ++
 package/libssh/libssh.mk   | 16 ++++++++++++++++
 package/remmina/Config.in  | 24 ++++++++++++++++++++++++
 package/remmina/remmina.mk | 32 ++++++++++++++++++++++++++++++++
 6 files changed, 85 insertions(+)
 create mode 100644 package/libssh/Config.in
 create mode 100644 package/libssh/libssh.hash
 create mode 100644 package/libssh/libssh.mk
 create mode 100644 package/remmina/Config.in
 create mode 100644 package/remmina/remmina.mk

-- 
2.5.0
