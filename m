From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 22:13:59 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5base: disable
 predefined -Og optimization
In-Reply-To: <20190622185146.8B40682B9F@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 22 Jun 2019 20:36:08 +0200")
References: <20190622185146.8B40682B9F@busybox.osuosl.org>
Message-ID: <87mui6kago.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=5857ab6a96be17615a05ff4e6a91d8f475890980
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Starting from Qt5 5.9.0, -optimize-debug is enabled by default for
 > debug builds causing -Og flag to be appended to CFLAGS and
 > consequently override TARGET_CFLAGS. We don't want this so let's pass
 > -no-optimize-debug to QT5BASE_CONFIGURE_OPTS if QT5_VERSION_LATEST=y.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
