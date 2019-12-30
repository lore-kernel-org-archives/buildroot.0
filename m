From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Dec 2019 18:42:41 +0000
Subject: [Buildroot] [Bug 12441] qt5webengine build error: asm/errno.h: No
 such file or directory
In-Reply-To: <bug-12441-163@https.bugs.busybox.net/>
References: <bug-12441-163@https.bugs.busybox.net/>
Message-ID: <bug-12441-163-Q7q9YiskTE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12441

--- Comment #1 from Bartosz Bilas <bartosz.bilas@hotmail.com> ---
Hello Aleksandr,
does that error occur every build at the same time or randomly? Which buildroot
version exactly do you use? We have patched qt5webengine recently [1] so there
shouldn't be any problems with compilation this component.

[1]
https://github.com/buildroot/buildroot/commit/6cfe21ae90ccd88254bf5240b2b29d74794f45fe

Best
Bartek

-- 
You are receiving this mail because:
You are on the CC list for the bug.
