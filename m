From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 03 Jun 2019 14:07:32 +0000
Subject: [Buildroot] [Bug 11926] Cross compiled Qt applications aren't
 working anymore
In-Reply-To: <bug-11926-163@https.bugs.busybox.net/>
References: <bug-11926-163@https.bugs.busybox.net/>
Message-ID: <bug-11926-163-5QT7NSo6oj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11926

--- Comment #4 from ramtheconqueror at gmail.com ---
(In reply to Thomas Petazzoni from comment #3)
Hello Thomas,

I've reverted that change and still no use.

[Paths]
Prefix=@@HOST_DIR@@
Sysroot=@@STAGING_DIR@@
Headers=/usr/include/qt5
Libraries=/usr/lib
LibraryExecutables=/usr/libexec
Binaries=/usr/bin
Plugins=/usr/lib/qt/plugins
Examples=/usr/lib/qt/examples
Qml2Imports=/usr/qml
Imports=/usr/imports
Translations=/usr/translations
Examples=/usr/lib/qt/examples
Demos=/usr/lib/qt/examples
Tests=/usr/tests
Settings=/usr
Documentation=/usr/doc
ArchData=/usr
Data=/usr

Anything else please? Thanks for your help.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
