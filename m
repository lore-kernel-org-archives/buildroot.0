From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:27:35 +0100
Subject: [Buildroot] [git commit] package/meson: never try to run
 generated target binaries
In-Reply-To: <20181228104954.5FF0681240@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Fri, 28 Dec 2018 11:52:37 +0100")
References: <20181228104954.5FF0681240@busybox.osuosl.org>
Message-ID: <87sgxq3xko.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f112f2b991b47a7309116e132c969e3731a7e911
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > As explained in [0], meson will try on its own to decide whether it can
 > run what it builds. If it happens that the host and target CPUs are
 > "compatible", that test may fail and meson may believe it can run what
 > it builds.

 > Override that test by using needs_exe_wrapper=true, and not defining an
 > actual exe_wrapper.

 > [0] https://mesonbuild.com/Cross-compilation.html

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > [yann.morin.1998 at free.fr:
 >   - split in its own patch
 >   - improve commit log
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
