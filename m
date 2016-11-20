From: pierre floury <devpfl@gmail.com>
Date: Sun, 20 Nov 2016 19:59:45 +0100
Subject: [Buildroot] [v3,0/2] package/efl: enable libdrm support
Message-ID: <1479668387-6549-1-git-send-email-devpfl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pierre Floury <devpfl@gmail.com>

the folowing patches are the work done by Romain Naour
to add drm and gl-drm support to package/efl

cf http://lists.busybox.net/pipermail/buildroot/2016-September/172422.html

I just rebase the v2 patches on top of the master

Romain Naour (2):
  package/efl: enable libdrm support
  package/efl: add Evas GL DRM Engine support

 package/efl/Config.in | 13 +++++++++++++
 package/efl/efl.mk    | 17 ++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.1.4
