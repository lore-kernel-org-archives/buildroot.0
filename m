From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 22:46:02 +0200
Subject: [Buildroot] [PATCH] linux-zigbee: new package
In-Reply-To: <1399139280-9258-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1399139280-9258-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160809224602.0cecd1a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 May 2014 19:48:00 +0200, Maxime Hadjinlian wrote:
> linux-zigbee is a mix of utility tools that implements a 802.15.4 stack
> along with a usefull library for any program that would need to use this
> stack.
> 
> Note that the name is mislead, for licensing reason, this does *NOT*
> implement the ZigBee protocol.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

FWIW, following a build failure on this package, I did a patch, which I
submitted upstream. Here is the answer I got from upstream (more
precisely Alexander Aring) :

"""
Thanks for the patch, but this userspace software is unmaintained.
You should use wpan-tools [0] which used nl802154, this is available
since kernel 3.19.

It's not recommended to use the stack in earlier kernel versions.
We don't have a stable strategy yet (except extrem imporant fixed,
root exploit, etc. :-))

- Alex

[0] http://wpan.cakelab.org/releases/
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
