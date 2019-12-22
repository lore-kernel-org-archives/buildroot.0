From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 16:01:26 +0100
Subject: [Buildroot] [git commit] package/genimage: add patch to support
 vfat volume-label
In-Reply-To: <20191221212320.354B08D318@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 21 Dec 2019 22:22:42 +0100")
References: <20191221212320.354B08D318@busybox.osuosl.org>
Message-ID: <8736dc2ym1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=aeb517522fc60747caa340cc0f2500fc94106b63
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Import "0001-image-vfat-Add-label-option-to-set-volume-name.patch" from
 > the upstream repository. The changes made to the README.rst file had to
 > be removed from the patch so that the package can be compiled in
 > buildroot. The patch has been accepted upstream, but no releases have
 > been made yet which includes the feature.

 > Signed-off-by: Dario Binacchi <dariobin@libero.it>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Why? What is this required for? When is the next genimage version expected?

-- 
Bye, Peter Korsgaard
