From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 15 May 2013 14:54:27 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20130515140651.425F39A216@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90e7cdd28c82212a884902d46f13634f5509b3d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   51 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 04c1eed..3009071 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,9 +2,54 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: dbus, gutenprint, hplip, json-c,
-	libcurl, pulseaudio, python-nfc, qt5imageformats, strace,
-	wvstreams
+	Default number of parallel jobs is now number of CPUs + 1.
+
+	Defconfigs: Add Telit EVK-PRO3, AT91SAM9260-EK Nand flash.
+
+	Updated/fixed packages: busybox, cairo, classpath, curlftpfs,
+	czmq, dbus, f2fs-tools, fan-ctrl, filemq, gst-plugin-bad,
+	gutenprint, hplip, json-c, libatomic_ops, libcurl, libdrm,
+	libnspr, libnss, libsha1, libsigsegv, libxcb, linknx,
+	linux-pam, lttng-modules, lttng-tools, matchbox-lib, mcookie,
+	mesa3d, neon, pixman, pulseaudio, python-nfc, qt5imageformats,
+	quota, openssl, sconeserver, strace, sylpheed, wvstreams,
+	xapp_{appres,bdftopcf,beforelight,bitmap,edires,fonttosfnt},
+	xapp_{fslsfonts,fstobdf,iceauth,ico,listres,luit,mkfontdir},
+	xapp_{mkfontscale,oclock,rgb,rstart,scripts,sessreg,setxkbmap},
+	xapp_{showfont,smproxy,twm,viewres,x11perf,xauth,xbacklight},
+	xapp_x{biff,calc,clipboard,clock,cmsdb,cursorgen,dbedizzy,ditview},
+	xapp_x{dm,dpyinfo,driinfo,edit,ev,eyes,f86dga,fd,fontsel,fs,fsinfo},
+	xapp_x{gamma,gc,host,input-calibrator,input,kbcomp,kbevd,kbprint},
+	xapp_x{kbutils,kill,load,logo,lsatoms,lsclients,lsfonts,mag,man},
+	xapp_x{message,mh,modmap,more,pr,prop,randr,rdb,refresh,set,setmode},
+	xapp_x{setpointer,setroot,sm,stdcmap,vidtune,vinfo,wd,wininfo,wud},
+	xcb-util, xcursor-transparent-theme, xdata_xbitmaps,
+	xdata_xcursor-themes,
+	xdriver_xf86-input-{evdev,joystick,keyboard,mouse,synaptics},
+	xdriver_xf86-input-{tslib,vmmouse,void},
+	xdriver_xf86-video-{ark,ast,ati,cirrus,dummy,fbdev,geode,glide},
+	xdriver_xf86-video-{glint,i128,intel,mach64,mga,neomagic,newport},
+	xdriver_xf86-video-{nv,openchrome,r128,savage,siliconmotion,sis},
+	xdriver_xf86-video-{tdfx,tga,trident,v4l,vesa,vmware,voodoo,wsfb},
+	xfont_encodings, xfont_font-adobe-{100,75}dpi,
+	xfont_font-utopia-{100dpi,75dpi,type1},
+	xfont_font-{alias,arabic-misc,bh-100dpi,bh-75dpi},
+	xfont_font-bh-lucidatypewriter-{100,75}dpi, xfont_font-bh-{ttf,type1},
+	xfont_font-bitstream-{100dpi,75dpi,type1}, xfont_font-cronyx-cyrillic,
+	xfont_font-{cursor,daewoo,dec,isas,jis,micro}-misc,
+	xfont_font-ibm-type1, xfont_font-misc-{cyrillic,ethiopic,meltho,misc},
+	xfont_font-{mutt,schumacher}-misc,
+	xfont_font-{screen-cyrillic,sony-misc,sun-misc,util},
+	xfont_font-winitzki-cyrillic, xfont_font-xfree86-type1,
+	xlib_lib{FS,ICE,SM,X11,XScrnSaver,Xau,Xaw,Xcomposite,Xcursor},
+	xlib_libX{damage,dmcp,ext,fixes,font,ft,i,inerama,mu,pm,randr},
+	xlib_libX{render,res,t,tst,v,vMC,xf86dga,xf86vm},
+	xlib_lib{dmx,fontenc,pciaccess,pthread-stubs,xkbfile}, xlib_xtrans,
+	xproto_{applewm,bigreqs,composite,damage,dmx,dri2,fixes}proto,
+	xproto_{fontcache,font,gl,input,kb,randr,record,render}proto,
+	xproto_{resource,scrnsaver,video,windowswm,xcmisc,xext}proto,
+	xproto_{xf86bigfont,xf86dga,xf86dri,xf86vidmode,xinerama,x}proto,
+	xserver_xorg-server, xutil_{makedepend,util-macros}
 
 	Issues resolved (http://bugs.uclibc.org):
 
