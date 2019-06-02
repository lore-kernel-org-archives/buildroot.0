From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 02 Jun 2019 20:14:34 +0000
Subject: [Buildroot] [Bug 11926] Cross compiled Qt applications aren't
 working anymore
In-Reply-To: <bug-11926-163@https.bugs.busybox.net/>
References: <bug-11926-163@https.bugs.busybox.net/>
Message-ID: <bug-11926-163-9mYtrlVimr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11926

--- Comment #2 from ramtheconqueror at gmail.com ---
Even the Qt cinematic experience which is compiled as part of the buildroot is
not working a well.

# CinematicExperience-demo
/usr/share/Qt5/CinematicExperience/Qt5_CinematicExperience: error while loading
shared libraries:
/home/ram/work/Linux-tool/buildroot-output/2019.05-rc3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libGLESv2.so:
cannot open shared object file: No such file or directory

-- 
You are receiving this mail because:
You are on the CC list for the bug.
