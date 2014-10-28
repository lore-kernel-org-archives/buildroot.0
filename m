From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 28 Oct 2014 20:39:37 +0100
Subject: [Buildroot] [PATCH v4 1/1] glmark2: new package
References: <1413580298-6255-1-git-send-email-bernd.kuhls@t-online.de>
 <20141028193444.72b79a2d@free-electrons.com>
Message-ID: <XnsA3D4D22AF6F3DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141028193444.72b79a2d at free-electrons.com:

> Checking for 'wayland-egl'               : not found 

Hi,

glmark2 searches for wayland-egl.pc. Afaics the only package providing this 
file is mesa3d:
https://packages.debian.org/search?searchon=contents&keywords=wayland-
egl.pc&mode=path&suite=stable&arch=any

According to this posting from 2012 the RPI does not provide wayland-egl:
http://lists.freedesktop.org/archives/wayland-devel/2012-November/006216.html

As I do not have access to a RPI I would like to ask if this is still 
correct. If yes, I need to change the dependencies.

Regards, Bernd
