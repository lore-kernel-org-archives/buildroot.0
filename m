From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 13 Nov 2017 15:42:32 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <20171113102757.ir7so5o7h7zopcvq@dell5510>
References: <20171113102757.ir7so5o7h7zopcvq@dell5510>
Message-ID: <20171113144231.gddccsqlelrhrokw@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> But I cannot rebuild it as it fails to pass configure:

> $ make distclean
> $ wget -c http://autobuild.buildroot.net/results/bf31199cdaa18971a9b599c26fbefac73b2d6f30/config -O .config.old
> $ make olddefconfig
> $ make
> make: *** No rule to make target 'toolchain-external-custom', needed by '/home/foo/install/src/buildroot.git/output/build/toolchain-external/.stamp_configured'.  Stop.

> What can be wrong? I've done it this way in the past (with other autobuild items, which
> had different toolchains).

> [1] http://autobuild.buildroot.net/results/bf31199cdaa18971a9b599c26fbefac73b2d6f30

And of course, I'm working on current master.


Kind regards,
Petr
