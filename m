From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 May 2020 09:25:36 +0000
Subject: [Buildroot] [Bug 12416] qt5webengine should not use WEBENGINE_CONFIG
In-Reply-To: <bug-12416-163@https.bugs.busybox.net/>
References: <bug-12416-163@https.bugs.busybox.net/>
Message-ID: <bug-12416-163-jN1iaK44uH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12416

--- Comment #3 from JeffyCN <jeffy.chen@rock-chips.com> ---
Hi guys,

the qt packages are using pkg-qmake.mk now, and the pending patch seems to be
wrong..:

$(QT5WEBENGINE_QMAKEFLAGS) -- $(QT5WEBENGINE_CONFIG))

needs a '--' between webengine config and other qmake flags.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
