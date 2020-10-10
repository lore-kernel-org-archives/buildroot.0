From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:40:02 +0200
Subject: [Buildroot] [git commit] package/mesa3d: drop r100 dependency
 on _HAS_ATOMIC
In-Reply-To: <20201006205232.9EA258EB92@busybox.osuosl.org> (Yann E. MORIN's
 message of "Tue, 6 Oct 2020 23:01:28 +0200")
References: <20201006205232.9EA258EB92@busybox.osuosl.org>
Message-ID: <87sgalerx9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=0b029cac1bcacc957407e6437ffd371171f0607a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This partially reverts commit a3aac6d84713db7e6d2683eabf965eae21ce48bf,
 > just dropping the atomic dependency.

 > That dependency would introduce a "recursive dependency" chain in
 > Kconfig.

 > However, r100 is only available on i386 and x86-64, and they both have
 > sync4, which means libdrm's HAS_ATOMICS is always 'y' when r100 is
 > available.

 > So, like we did in 00c1a8c34f7 (package/mesa3d: propagate missing
 > libdrm-freedreno deps), we just add a fat comment that explains why the
 > dependency is not propagated.

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: James Hilliard <james.hilliard1@gmail.com>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
