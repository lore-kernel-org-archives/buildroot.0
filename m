From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jan 2020 23:46:57 +0100
Subject: [Buildroot] [git commit] package/python-pyqt5: manage qt
 optional dependencies
In-Reply-To: <20191226195604.10EEA8E612@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 26 Dec 2019 20:58:09 +0100")
References: <20191226195604.10EEA8E612@busybox.osuosl.org>
Message-ID: <87r20ahoke.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=2320dec34c87d28ab7ab3f445e3f6e429023f01f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Explictly enable the needed pyqt5 modules depending on Qt5 options or
 > packages

 > QtQuick moodule can't be built without opengl support so enable only
 > when OpenGL is available

 > Fixes:
 >  - https://bugs.buildroot.org/show_bug.cgi?id=12121
 >  - http://autobuild.buildroot.org/results/cb69c5daa564aa9f3250faa395399cb00a445e85

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
