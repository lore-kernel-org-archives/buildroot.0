From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 20:20:11 +0100
Subject: [Buildroot] [PATCH master 1/1] qt5: bump latest version to 5.9.4
In-Reply-To: <20180227174826.1277-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Tue, 27 Feb 2018
 18:48:26 +0100")
References: <20180227174826.1277-1-sebastien.szymanski@armadeus.com>
Message-ID: <87woyynst0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?bastien" == S?bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

 > qt5connectivity:
 >  - removed
 >  0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
 >  (upstream comitted [1])

 > qt5quickcontrols2:
 >  - removed 0001-Example-flatstyle-needs-widgets-module.patch (upstream
 >  comitted [2])

 > qt5webengine:
 >  - removed 0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
 >  (upstream comitted, reverted and recomitted [3])

 > [1] https://codereview.qt-project.org/211810
 > [2] https://codereview.qt-project.org/212583
 > [3] https://codereview.qt-project.org/209547

 > Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
 > ---
 > N.B: I didn't try to build all the modules but only the following ones:
 > qt5base qt5declarative qt5quickcontrols qt5quickcontrols2 qt5serialbus
 > qt5serialport qt5svg qt5virtualkeyboard qt5xmlpatterns

Committed, thanks.

-- 
Bye, Peter Korsgaard
