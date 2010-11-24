From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 23 Nov 2010 20:00:44 -0500
Subject: [Buildroot] [PATCH] toolchain-external: allow vendor-controlled
	defaults
In-Reply-To: <20101123223513.67c22630@surf>
References: <1290076101-31697-1-git-send-email-vapier@gentoo.org>
	<20101118115529.2f2b57c5@surf> <20101123223513.67c22630@surf>
Message-ID: <201011232000.45481.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, November 23, 2010 16:35:13 Thomas Petazzoni wrote:
> On Thu, 18 Nov 2010 11:55:29 +0100 Thomas Petazzoni wrote:
> > > +-include target/device/*/ext-tool.mk
> > > +
> > 
> > I definitely really don't like this. Could you elaborate a bit on what
> > you would like to do ?
> 
> Mike, could you give an example of an ext-tool.mk you are using, for me
> to better understand what feature you want ?

http://blackfin.uclinux.org/git/?p=users/vapier/buildroot.git;a=blob;f=target/device/AnalogDevices/arch-
bfin/ext-
tool.mk;h=e5c1713bc9ddb0a2e5daaf35af3d97188c73272b;hb=1bfab3167398d64b16ac1b8b97f8d90c28f3ec29
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101123/5f6b15c9/attachment.pgp>
