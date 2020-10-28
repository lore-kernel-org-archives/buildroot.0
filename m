From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2020 22:57:50 +0100
Subject: [Buildroot] [git commit] package/kernel-module-imx-gpu-viv: fix
 disabling kernel option
In-Reply-To: <20201017072212.F0F7F821F0@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sat, 17 Oct 2020 09:33:21 +0200")
References: <20201017072212.F0F7F821F0@busybox.osuosl.org>
Message-ID: <87o8kmhv35.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=74a8865b2fa58a26c567e5fef1faa6df639deda7
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 391c448acbb9 (package/kernel-module-imx-gpu-viv: bear the kernel
 > options munging) improperly named the macro, including a superfluous
 > 'MODULE' in the middle of the macro name, which meant it was totally
 > unused.

 > Fix that.

 > Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
