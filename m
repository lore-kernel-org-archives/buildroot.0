From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 23:08:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Execute
	MESA3D_REMOVE_OPENGL_PC also for DRI configs lacking OpenGL
In-Reply-To: <1463510499-1418-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Tue, 17 May 2016 20:41:39 +0200")
References: <1463510499-1418-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87d1ob9nb0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Mesa3d provides libgl only with DRI drivers and X.org enabled. Since
 > https://git.busybox.net/buildroot/commit/package/mesa3d/mesa3d.mk?id=f1894ec95728806e09405d26663e0ea371afaeab

 > DRI drivers can be enabled without X.org support, but mesa3d still does
 > not provide OpenGL support so we also need to remove the pkgconf files
 > in this case. A POST_INSTALL_*_HOOK is already present but needs to be
 > executed not only when DRI support was disabled but also with DRI en-
 > and X.org disabled.

 > Fixes
 > http://autobuild.buildroot.net/results/342/3420ad6aa8e1e8151bf11b43be2c97cbe1dbb400/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
