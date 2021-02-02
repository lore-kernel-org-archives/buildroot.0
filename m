From: manu f <e.fiancette@gmail.com>
Date: Tue, 2 Feb 2021 23:22:27 +0100
Subject: [Buildroot] [BuildRoot] qt error : QEGLPlatformContext: Failed to
 create context: 3005
Message-ID: <CAGshWo3wmQN=zA27dWczEP4Tr9pSenpNR-icy8FOSuYjxQ78vA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I compile buildroot 2020.02.9 with nxp kernel 4.9 for imx.6.
I have a qt web browser app (working in another context) and when I launch
it I get:

# light_web_browser --no-sandbox
Version
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
QEglFSVivIntegration will set environment variable FB_MULTI_BUFFER=2 to
enable double bufferi
ng and vsync.
 If this is not desired, you can override this via: export
QT_EGLFS_IMX6_NO_FB_MULTI_BUFFER=1
Unable to query physical screen size, defaulting to 100 dpi.
To override, set QT_QPA_EGLFS_PHYSICAL_WIDTH and
QT_QPA_EGLFS_PHYSICAL_HEIGHT (in millimeters
                        ).
QEGLPlatformContext: Failed to create context: 3005
Attribute Qt::AA_ShareOpenGLContexts must be set before QCoreApplication is
created.
WebEngineContext used before QtWebEngine::initialize() or OpenGL context
creation failed.
Segmentation fault

I read on google that qt5.12 is not compatible with nxp kernel version 4.9
.. is somebody could confirm (I didnt find support table for qt vs nxp
kernel) ?
or could it be another problem?
I dont know exactly where to search.

Thanks for helping.

Regards

Emmanuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210202/72986472/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 134795 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210202/72986472/attachment-0001.obj>
