From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Mon, 1 Sep 2008 02:06:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: games
 games/ace_of_penguins games/gnuch etc...
In-Reply-To: <COL102-DS131551BA49AC350CABE3EFDC630@phx.gbl>
References: <20080829132737.BF3503C864@busybox.net>
	<20080829153841.37df370c@atmel.com>
	<BD79186B4FD85F4B8E60E381CAEE19097AE654@mi8nycmail19.Mi8.com>
	<19223815.post@talk.nabble.com>
	<COL102-DS131551BA49AC350CABE3EFDC630@phx.gbl>
Message-ID: <19250901.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have just tried to patch various games packages and java ones
jamvm (packages/java/jamvm) works fine patch-version and patch-version.arch
work

ace_of_penguins - the libtool patch fails I think this a fault with libtool
patch not the dir move
lxdoom - patch target works
rubix - patch target works
gnuchess - patch target works
vice - patch target works

So I think the move is fine and that the issues are with making the libtool
patch apply to more targets
Daniel Laird

-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package%3A-games-games-ace_of_penguins-games-gnuch-etc...-tp19219940p19250901.html
Sent from the BuildRoot mailing list archive at Nabble.com.
