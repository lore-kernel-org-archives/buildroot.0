From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 20 Dec 2012 15:51:18 +0100
Subject: [Buildroot] [PATCH] Makefile: fix cross target
In-Reply-To: <87pq24yemq.fsf@dell.be.48ers.dk>
References: <1356012991-32494-1-git-send-email-fabio.porcedda@gmail.com>
 <87pq24yemq.fsf@dell.be.48ers.dk>
Message-ID: <CAHkwnC-4ewBJ2qgqT3B8S9dRxsL07tuece49xvvGLjgv2fX4EQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 20, 2012 at 3:36 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
>
> Hi,
>
>  Fabio> The cross target was laking some dependency.
>  Fabio> Now it's possible to successfully use the target right
>  Fabio> after the configuration.
>
> The fix is fine, but what exactly is your use case for using 'make
> cross'? It's not documented anywhere, and I was thinking about dropping
> it.

Sometimes i just want to built/prepare only the toolchain right after
using a defconfig or a make clean,
to be able to use the toolchain for building specific buildroot
packages or compile local source code outside buildroot without build
unnecessary stuff like busybox, rootfs, etc...

If it's useful i can submit a patch to document it.

Best regards
--
Fabio Porcedda
