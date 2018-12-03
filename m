From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 03 Dec 2018 12:41:34 +0000
Subject: [Buildroot] [Bug 11501] compile sdl2 with enable wayland
In-Reply-To: <bug-11501-163@https.bugs.busybox.net/>
References: <bug-11501-163@https.bugs.busybox.net/>
Message-ID: <bug-11501-163-BeqGQZ5jo9@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11501

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
package/sdl2/sdl2.mk currently contains --disable-video-wayland, so we don't
support building againt Wayland. Therefore, I guess you got this error after
making some changes to Buildroot to add Wayland support to the SDL2 package ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
