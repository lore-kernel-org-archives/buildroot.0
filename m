From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:16:12 +0200
Subject: [Buildroot] [git commit] package/python-iptables: account for
 platform tag in extensions
In-Reply-To: <20200415201730.729FC8ECF1@busybox.osuosl.org> (Yann E. MORIN's
 message of "Wed, 15 Apr 2020 22:24:46 +0200")
References: <20200415201730.729FC8ECF1@busybox.osuosl.org>
Message-ID: <87imh9fxsz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=52276cdda34aa986410626592031560bf64d788b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > EXT_SUFFIX in Python versions > 3.5 contains a platform tag which only applies
 > to cpython extensions. Given that ctypes.util.find_library does not work on the
 > target due to the absence of the underlying tools '.so' needs to be added as a
 > possible suffix for libraries to enable python-iptables to find the iptables
 > shared libraries.

 > Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
