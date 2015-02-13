From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 13 Feb 2015 15:20:18 +0100
Subject: [Buildroot] Qt5 + OPENGL
Message-ID: <75EEE06A0FB7478EA7D2185032B5E93F@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
 Hi all

While trying to get Qt5 running with OpenGL: (egl)

# modprobe vivante
[drm] Initialized vivante 1.0.0 20120216 on minor 0

# /usr/lib/qt/examples/webkitwidgets/browser/browser
MESA-LOADER: malformed or no PCI ID
gbm: failed to open any driver (search paths /usr/lib/dri)
gbm: Last dlopen error: File not found
failed to load driver: vivante
Unable to query physical screen size, defaulting to 100 dpi.
To override, set QT_QPA_EGLFS_PHYSICAL_WIDTH and QT_QPA_EGLFS_PHYSICAL_HEIGHT (in millimeters).
EGL Error : Could not create the egl surface: error = 0x300b

Aborted
#

# ls /usr/lib/dri
kms_swrast_dri.so  swrast_dri.so
#



Sagaert Johan


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: karo-tx6dl_3_16_0_EDT0700_qt5g_defconfig.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150213/80797881/attachment.txt>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 6253 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150213/80797881/attachment.bin>
