From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 21:51:10 +0100
Subject: [Buildroot] [PATCH] qt5multimedia: enable gstreamer-1.x support
In-Reply-To: <1419163196-28128-1-git-send-email-ps.report@gmx.net>
References: <1419163196-28128-1-git-send-email-ps.report@gmx.net>
Message-ID: <20141227215110.10276b5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sun, 21 Dec 2014 12:59:56 +0100, Peter Seiderer wrote:
> Add 0001-Initial-porting-effort-to-GStreamer-1.0.patch from [1] (with minor
> conflict fixed).
> Add 0002-Fix-compilation-when-building-against-GStreamer-0.10.patch from [2].
> 
> Fix qt5multimedia.mk for the gstreamer-1.x case.
> 
> [1] https://qt.gitorious.org/qt/tolszaks-qtmultimedia/commit/c847d2f36bd45befcd44d52f92140758563350bf.patch
> [2] https://qt.gitorious.org/qt/tolszaks-qtmultimedia/commit/609048bd6fcd37162b2b5b139392a8ec8b2260e9.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

We have another patch at http://patchwork.ozlabs.org/patch/424107/ that
bumps the entire Qt5 stuff to Qt 5.4.0. How would this interact with
your patch enabling gstreamer 1.x support? Is gstreamer 1.x support
part of Qt 5.4.0 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
