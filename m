From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 22:00:48 +0100
Subject: [Buildroot] [PATCH v4 1/1] glmark2: new package
In-Reply-To: <XnsA3D4D22AF6F3DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1413580298-6255-1-git-send-email-bernd.kuhls@t-online.de>
 <20141028193444.72b79a2d@free-electrons.com>
 <XnsA3D4D22AF6F3DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20141028220048.68d80815@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 28 Oct 2014 20:39:37 +0100, Bernd Kuhls wrote:
> [posted and mailed]
> 
> Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
> @public.gmane.org> wrote in news:20141028193444.72b79a2d at free-electrons.com:
> 
> > Checking for 'wayland-egl'               : not found 
> 
> Hi,
> 
> glmark2 searches for wayland-egl.pc. Afaics the only package providing this 
> file is mesa3d:
> https://packages.debian.org/search?searchon=contents&keywords=wayland-
> egl.pc&mode=path&suite=stable&arch=any
> 
> According to this posting from 2012 the RPI does not provide wayland-egl:
> http://lists.freedesktop.org/archives/wayland-devel/2012-November/006216.html
> 
> As I do not have access to a RPI I would like to ask if this is still 
> correct. If yes, I need to change the dependencies.

Yann, maybe?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
