From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 5 Nov 2006 13:05:46 +0100
Subject: [Buildroot] Suggestion, move TARGET_DIR
Message-ID: <20061105120546.GB14530@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello again.

I have always felt that TARGET_DIR was kinda misplaced. build_<ARCH> is
for the source and staging (well, maybe not even staging).

so, what about making target_<ARCH> instead? 

I am working on autonomous packages (choose between making a pcakage a
part of the root file system or an autonomous tarball) and I am using 
TARGET_PKG_DIR for that. right now it's build_<ARCH>/packages.

but target_<ARCH>/root and target_<ARCH>/packages seems more right to
me.

but foloowing this logic would make us have to sed thorugh the whole
tree to change TARGET_DIR to TARGET_ROOT_DIR but that ain't exactly
difficult to do. (I can make a patch for it).

anyone with anything to say which likes it and will help getting the
patches in?


Thomas.
