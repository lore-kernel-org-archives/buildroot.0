From: David Bonnin <dboml@free.fr>
Date: Sat, 27 Oct 2012 11:45:54 +0200
Subject: [Buildroot] make help add-in
Message-ID: <508BAD52.4030000@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Because, i start to use BR:
     - I add manually files to output/target.
     - add files to output/staging  (was a mistake ;) )
     - start develop own package (without UNINSTALL_TARGET_CMDS in 
developement phase).
     - start make own board/defconfig ( with a lot ajustements).

So i do a lot of times cleaning target output folder:

find output/build/ -name .stamp_target_installed -exec rm {} \;
rm output/build/.root output/build/.customize
rm -rf output/target
rm -rf output/stamps/ext-toolchain-installed

is there a such target?

or an idea to put it in...
