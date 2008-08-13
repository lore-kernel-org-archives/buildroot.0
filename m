From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 13 Aug 2008 16:58:43 +0200
Subject: [Buildroot] Error during make
In-Reply-To: <48A2F37B.6060308@meteocontrol.de>
References: <48A2F37B.6060308@meteocontrol.de>
Message-ID: <20080813145843.GA9471@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 13, 2008 at 04:45:15PM +0200, Daniel Endres wrote:
>Hello Guys,
>
>I'm trying to build a toolchain as well as rootfs for a mipsel device.
>
>Therefore I'd like to use buildroot. The problem is that I'm getting
>some undefined references errors during the awk-build. Obviously the
>errors are due to a missing math-library.
>
>I've just downloaded the latest snapshot in the first place and tried
>the svn-version later on.
>Both giving me the same errors.
>
>I've just done a "make menuconfig" for buildroot, changed the target to
>mipsel, exited and hit "make".
>I don't know if I'm wrong, but shouldn't a clean build succeed ?
>
>Below I've posted my error-log. Hopefully some could point me in the
>right direction.

Well, as you correctly state you need stuff from libm, so configure your
libc to provide the required libm functionality.

see docs/README
