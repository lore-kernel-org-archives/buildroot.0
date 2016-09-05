From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 05 Sep 2016 17:16:05 +0200
Subject: [Buildroot] [PATH RFC] glmark2: check mesa3d opengl when adding
	drm
References: <1461930052-21032-1-git-send-email-mylene.josserand@free-electrons.com>
 <1461930052-21032-2-git-send-email-mylene.josserand@free-electrons.com>
Message-ID: <lqe0adx19n.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 29 Apr 2016 13:40:52 +0200 schrieb Myl?ne Josserand:

> When using Vivante OpenGL, the mesa3d is not enabling gbm which is
> needed by glmark3 with flavor "drm".

Hi,

there are other reasons why mesa3d does not provide gbm.
I think this patch is still valid because it fixes
http://autobuild.buildroot.net/results/cb7/cb765a1dbcbe6956a44974c3af35cf17420a6bf4/

Regards, Bernd
