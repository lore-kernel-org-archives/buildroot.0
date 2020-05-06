From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:16:07 +0200
Subject: [Buildroot] [git commit] package/python-iptables: add explicit
 dependency on dynamic libs
In-Reply-To: <20200415201730.58ED48ED12@busybox.osuosl.org> (Yann E. MORIN's
 message of "Wed, 15 Apr 2020 22:23:35 +0200")
References: <20200415201730.58ED48ED12@busybox.osuosl.org>
Message-ID: <87mu6lfxt4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=21b85bc56cdcf030cced57dea0f78cdce59912b8
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The package uses ctypes.CDLL extensively which only makes sense when dynamic
 > libraries are available.

 > Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
