From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 28 Dec 2014 14:18:25 +0100
Subject: [Buildroot] [PATCH] qt5multimedia: enable gstreamer-1.x support
Message-ID: <trinity-c614b5c0-eb9d-4c40-9751-efea2f308716-1419772704957@3capp-gmx-bs66>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, Dec 27, 2014 at 09:51:10PM +0100, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Sun, 21 Dec 2014 12:59:56 +0100, Peter Seiderer wrote:
> > Add 0001-Initial-porting-effort-to-GStreamer-1.0.patch from [1] (with minor
> > conflict fixed).
> > Add 0002-Fix-compilation-when-building-against-GStreamer-0.10.patch from [2].
> > 
> > Fix qt5multimedia.mk for the gstreamer-1.x case.
> > 
> > [1] https://qt.gitorious.org/qt/tolszaks-qtmultimedia/commit/c847d2f36bd45befcd44d52f92140758563350bf.patch
> > [2] https://qt.gitorious.org/qt/tolszaks-qtmultimedia/commit/609048bd6fcd37162b2b5b139392a8ec8b2260e9.patch
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> We have another patch at http://patchwork.ozlabs.org/patch/424107/ that
> bumps the entire Qt5 stuff to Qt 5.4.0. How would this interact with
> your patch enabling gstreamer 1.x support? Is gstreamer 1.x support
> part of Qt 5.4.0 ?

No sorry, gstreamer 1.x support is not part of Qt-5.4.0 (checked already beforehand,
would have saved me a little work), but I can rebase/resend my patch after
the Qt bump is committed...

Regards,
Peter

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
