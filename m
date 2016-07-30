From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 15:52:53 +0200
Subject: [Buildroot] bug in xserver compilation?
In-Reply-To: <trinity-da9783ca-4f43-4b57-be77-0d1d9462a02a-1469802318313@3capp-mailcom-bs06>
References: <trinity-5c752dae-1ff7-4dbc-8baa-935b9342af4a-1469739383586@3capp-mailcom-bs07>
 <20160728233003.4ce258a7@free-electrons.com>
 <trinity-da9783ca-4f43-4b57-be77-0d1d9462a02a-1469802318313@3capp-mailcom-bs06>
Message-ID: <20160730155253.51aa8880@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jul 2016 16:25:18 +0200, daggs wrote:

> > This is a known issue. Bernd posted a patch to fix it "[PATCH 1/2]
> > package/x11r7/xserver_xorg-server: add libdrm-specific cflags" but I
> > wasn't happy with it. You can see my reply from this Monday in the
> > mailing list archives.
> 
> thanks for info., is this a version related regression?

I have no idea. I believe the problem has existed for a while, but I'm
not sure.

A proper patch is welcome, though :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
