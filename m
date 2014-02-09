From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  9 Feb 2014 13:47:08 +0100
Subject: [Buildroot] [PATCH 0/4] More autobuilder fixes
Message-ID: <1391950032-5312-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Another series fixing autobuilder failures. ;-)

Yours,
Samuel

Samuel Martin (4):
  kexec: rename patch to add sequence number
  kexec: fix build failure
  vlc: fix glx support
  vlc: fix typo when setting VLC_CONF_ENV

 ...-largefile.patch => kexec-0001-largefile.patch} |  0
 ...ix-build-failure-bzImage_support_efi_boot.patch | 28 ++++++++++++++++++++++
 package/vlc/vlc.mk                                 |  9 ++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)
 rename package/kexec/{kexec-largefile.patch => kexec-0001-largefile.patch} (100%)
 create mode 100644 package/kexec/kexec-0002-i386-fix-build-failure-bzImage_support_efi_boot.patch

--
1.8.5.4
