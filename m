From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 5 Mar 2021 16:10:27 +0100
Subject: [Buildroot] Analysis of build results for 2021-03-03
In-Reply-To: <20210304224926.45aa4056@windsurf.home>
References: <20210304081519.C821B4B530@smtp4.osuosl.org>
 <20210304224926.45aa4056@windsurf.home>
Message-ID: <CAEyMn7YFHLJ=SBaB8N4NGaKN=tO_UYAO13-D2-JUnyoLQpoWAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and all,

[---]
> >  powerpc64   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/49efc0e93ad8fe30e5f32fed8a1efc1d2afd830e |
>
> -- Installing missing sysrepo modules...
> [ERR]: Retrieving GID "8000" grp entry failed (No such GID).
> sysrepoctl error: Failed to connect (Item not found)
> [ERR]: Retrieving GID "8000" grp entry failed (No such GID).
> sysrepoctl error: Failed to connect (Item not found)
> CMake Error at cmake_install.cmake:77 (message):
>    scripts/setup.sh failed: 1
>
> Ah this seems like netopeer2's build system is looking at the host too
> much ?

Indeed. The netopeer package is a bit annoying to install. But I hope
Jan Kundrat will make his offer come true [1] and provide a better
solution.

Since the problem currently only occurs on one autobuild host, I would
leave it alone until then. Is that ok for you? Or should I try to
patch the problem?

[1] http://lists.busybox.net/pipermail/buildroot/2021-February/303560.html

[...]

Thank you
-- 
Heiko
