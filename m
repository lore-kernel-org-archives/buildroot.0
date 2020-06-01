From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 01 Jun 2020 19:34:49 +0000
Subject: [Buildroot] [Bug 12971] qt5webengine: graph-depends seems producing
 incorrect output
In-Reply-To: <bug-12971-163@https.bugs.busybox.net/>
References: <bug-12971-163@https.bugs.busybox.net/>
Message-ID: <bug-12971-163-nU6XMihPow@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12971

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
qt5quickcontrols and qt5quickcontrols2 seems to be run-time dependencies as the
compile-time dependencies (see package/qt5/qt5webengine/qt5webengine.mk) are
only given as:

QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp \
        qt5declarative qt5webchannel host-bison host-flex host-gperf \
        host-pkgconf host-python

-- 
You are receiving this mail because:
You are on the CC list for the bug.
