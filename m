From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 23:23:21 +0100
Subject: [Buildroot] [git commit] package/systemd: explicitly configure
 split-usr=false and split-bin=true
In-Reply-To: <20181111205241.3D835825C3@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 11 Nov 2018 21:55:10 +0100")
References: <20181111205241.3D835825C3@busybox.osuosl.org>
Message-ID: <87r2f823vq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e9b70f96e8200956c871810d7b7a60017b9b974d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > meson-based build of systemd runs a couple of checks on the structure
 > of the *host* system which will incorrectly configure systemd if build
 > host configuration doesn't match Buildroot target.

 > One can also find the following in the NEWS file:

 > * A new -Dsplit-bin= build configuration switch may be used to specify
 >   whether bin and sbin directories are merged, or if they should be
 >   included separately in $PATH and various listings of executable
 >   directories. The build configuration scripts will try to autodetect
 >   the proper values of -Dsplit-usr= and -Dsplit-bin= based on build
 >   system, but distributions are encouraged to configure this
 >   explicitly.

 > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
