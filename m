From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 23:13:50 +0100
Subject: [Buildroot] [PATCH 3/3 v2] package: hide golang packages for
 toolchains with binutils bug 20006
In-Reply-To: <d64c03d07584a8f48ab309fff66d2ee5661d5ee3.1543137559.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 25 Nov 2018 10:19:50 +0100")
References: <cover.1543137559.git.yann.morin.1998@free.fr>
 <d64c03d07584a8f48ab309fff66d2ee5661d5ee3.1543137559.git.yann.morin.1998@free.fr>
Message-ID: <87y3961co1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fixes:
 >     http://autobuild.buildroot.org/results/020/02039969b16534d4020ecd4574bae71b91c1e6b8/ (flannel)
 >     http://autobuild.buildroot.org/results/e95/e9528b06b350ef84c1e2cb59fba87b4db77b4660/ (docker-engine)
 >     [...]

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Romain Naour <romain.naour@gmail.com>

 > ---
 > Changes v1 -> v2:
 >   - drop per-package dependency, move it to BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 >     (Thomas)

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
