From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Mon,  4 Feb 2013 21:50:27 +0100
Subject: [Buildroot] [PATCH] build of gdb-7.4.1 fails with unknown type of
	struct type
Message-ID: <1360011028-9946-1-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

while building the gdb package with buildroot the following error happen
 gdb-7.4.1/gdb/linux-nat.h:79:18: error: field 'siginfo' has incomplete type

Crosstool-NG has fixed this error in september 2012. With those patches
the above error want happen so I added them to the patchdir for gdb-7.4.1.
It also fixes
http://autobuild.buildroot.net/results/b894a5cecd9c5e0a1a751ebbff90a14aea1803da/build-end.log

Regards
Carsten
