From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:16:19 +0200
Subject: [Buildroot] [git commit] package/python-iptables: try known
 libc instead of find_library()
In-Reply-To: <20200415201730.691978ECF1@busybox.osuosl.org> (Yann E. MORIN's
 message of "Wed, 15 Apr 2020 22:24:41 +0200")
References: <20200415201730.691978ECF1@busybox.osuosl.org>
Message-ID: <87eerxfxss.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=90c18ab269c600ee7643f69212713ee3b74c38bd
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > ctypes.util.find_library() depends on gcc and friends to detect the location of
 > a given shared library. Given that these are not available on the target and
 > that python-iptables depends on this functionality we need to work around this.
 > The SONAMEs of the libc are well known so we try the known ones for glibc,
 > uClibc and musl.

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=12271

 > Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
