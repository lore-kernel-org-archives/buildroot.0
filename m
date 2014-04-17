From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Thu, 17 Apr 2014 13:19:38 +0100
Subject: [Buildroot] [PATCH v3] package/Zile: add Zile is Lossy Emacs editor
Message-ID: <1397737179-12262-1-git-send-email-alex.bennee@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Only the final patch left now as the libgc/atomic stuff has already
been merged.

Change

v2
  - fixup dependancies
  - add s-o-b tag to patch
  - fix whitespace
    
v3
  - fix typo for DEPENDENCIES
  - force AUTORECONF
  - remove +=
  - use BR2_GNU_MIRROR
  - rename patch to zile-0001-remove-help2man.patch


Alex Benn?e (1):
  package/zile: add Zile is Lossy Emacs editor

 package/Config.in                            |  1 +
 package/zile/Config.in                       | 13 ++++++++++++
 package/zile/zile-0001-remove-help2man.patch | 30 ++++++++++++++++++++++++++++
 package/zile/zile.mk                         | 15 ++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 package/zile/Config.in
 create mode 100644 package/zile/zile-0001-remove-help2man.patch
 create mode 100644 package/zile/zile.mk

-- 
1.9.2
