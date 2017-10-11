From: Motor-e LO Jean-Alexandre <jean-alexandre.lo@motor-e.fr>
Date: Wed, 11 Oct 2017 13:53:30 +0200
Subject: [Buildroot] Could not open egl display error on toradex apalis imx6q
Message-ID: <000e01d34287$8f0fc570$ad2f5050$@motor-e.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I cross-compile Qt5 with buildroot-2016.11
My board is an imx6q from Toradex.

I have this problem when I want to execute my program:
QML debugging is enabled. Only use this in a safe environment.
QEglFSVivIntegration will set environment variable FB_MULTI_BUFFER=2 to
enable double buffering and vsync.
If this is not desired, you can override this via: export
QT_EGLFS_IMX6_NO_FB_MULTI_BUFFER=1
Could not open egl display
Aborted

My default graphical platform is eglfs
On buildroot I selected :

*	open GL support
- open GL API (OpenGL ES 2.0+)
- openGL module
*	freescale im.x librairies: imx-gpu-viv

Before I use buildroot-2014.08 and it works!
I need some help to resolve this problem!

--

Cordialement / Best regards 
Jean-Alexandre LO
Ing?nieur logiciels embarqu?s / Embedded software engineer

 



1,rue royale 
Bureaux de la Colline, num?ro 218
Bat D - ?tage 7 
92213 Saint-Cloud Cedex 
Tel: +33 (0)1.41.12.66.08

 <http://www.motor-e.com> www.motor-e.com
 <mailto:jean-alexandre.lo@motor-e.fr> jean-alexandre.lo at motor-e.fr

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171011/e54e5984/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.png
Type: image/png
Size: 13578 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171011/e54e5984/attachment.png>
