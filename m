From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:51:45 +0200
Subject: [Buildroot] [git commit] suport/download: fix git wrapper with
 submodules on older git versions
In-Reply-To: <20200617205700.9DCBE825F5@busybox.osuosl.org> (Yann E. MORIN's
 message of "Wed, 17 Jun 2020 22:58:22 +0200")
References: <20200617205700.9DCBE825F5@busybox.osuosl.org>
Message-ID: <87v9ioy2su.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=8fe9894f655fd79207c41673e1966cc4d4d101d1
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Older versions of git store the absolute path of the submodules'
 > repository as stored in the super-project, e.g.:

 >     $ cat some-submodule/.git
 >     gitdir: /path/to/super-project/.git/modules/some-submodule

 > Obviously, this is not very reproducible.

 > More recent versions of git, however, store relative paths, which
 > de-facto makes it reproducible.

 > Fix older versions by replacing the absolute paths with relative ones.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
