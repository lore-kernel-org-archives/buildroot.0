From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 09:33:49 +0200
Subject: [Buildroot] [git commit] package/samba4: update
 samba4-cache.txt for fcntl flags check
In-Reply-To: <20210403064635.AB805818BF@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sat, 3 Apr 2021 09:11:25 +0200")
References: <20210403064635.AB805818BF@busybox.osuosl.org>
Message-ID: <871rbrbz4y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=c86434d720fdf1c42834162331c008e05c710d65
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes:
 > http://autobuild.buildroot.net/results/a5d/a5db81fca8ec07159b69b108b742f3d060e3316a/

 > Checking whether fcntl supports flags to send direct I/O availability signals                   : not found
 > ..
 > Cross answers file /srv/storage/autobuild/run/instance-3/output-1/build/samba4-4.14.2/cache.txt is incomplete

 > Samba4 has added a check for fcntl F_{G,S}ETOWN_EX handling since:
 > https://gitlab.com/samba-team/devel/samba/-/commit/5084a69de14f24e9d804998580eefcba773fdd5a

 > Which is supported by the Linux kernel since 2.6.32 in commit
 > ba0a6c9f6fceed11 (fcntl: add F_[SG]ETOWN_EX), so add it to the cache file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
