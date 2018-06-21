From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 21 Jun 2018 13:33:42 -0300
Subject: [Buildroot] [PATCH 0/2] pamtester: new package
Message-ID: <20180621163344.24552-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pamtester is a tiny utility program to test the pluggable authentication
modules (PAM) facility, which is a de facto standard of unified authentication
management mechanism in many unices and similar OSes including Solaris, HP-UX,
*BSD, MacOSX and Linux.

While specifically designed to help PAM module authors to test their modules,
that might also be handy for system administrators interested in building a
centralised authentication system using common standards such as NIS, SASL and
LDAP.

Carlos Santos (2):
  pamtester: new package
  DEVELOPERS: add myself to package/pamtester

 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/pamtester/0001-fix-spelling-errors.patch | 19 +++++++++++++++++++
 package/pamtester/Config.in                      | 11 +++++++++++
 package/pamtester/pamtester.hash                 |  2 ++
 package/pamtester/pamtester.mk                   | 13 +++++++++++++
 6 files changed, 47 insertions(+)
 create mode 100644 package/pamtester/0001-fix-spelling-errors.patch
 create mode 100644 package/pamtester/Config.in
 create mode 100644 package/pamtester/pamtester.hash
 create mode 100644 package/pamtester/pamtester.mk

-- 
2.14.4
