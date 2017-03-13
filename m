From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:15:56 +0100
Subject: [Buildroot] [PATCH v1 2/2] qt5base: install
	libQt5EglFsKmsSupport
In-Reply-To: <20170310221547.32158-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 10 Mar 2017 23:15:47 +0100")
References: <20170310221547.32158-1-ps.report@gmx.net>
 <20170310221547.32158-2-ps.report@gmx.net>
Message-ID: <87pohkwyxf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > According to src/plugins/platforms/eglfs/deviceintegration/deviceintegration.pro
 > depends on eglfs_gbm which depends according to src/gui/configure.json
 > on features.eglfs and features.gbm and features.kms, so dependency
 > on BR2_PACKAGE_MESA3D_OPENGL_EGL which enables mesa3d gbm support
 > should be sufficient.

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
