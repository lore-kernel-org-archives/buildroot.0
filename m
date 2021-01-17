From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 Jan 2021 14:44:04 +0000
Subject: [Buildroot] [Bug 13456] ccache prevents build
In-Reply-To: <bug-13456-163@https.bugs.busybox.net/>
References: <bug-13456-163@https.bugs.busybox.net/>
Message-ID: <bug-13456-163-fzOuGiSk4x@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13456

--- Comment #2 from Frank Wunderlich <frank-w@public-files.de> ---
mhm, seems to be fixed in 2020.11-825...ccache is also created in
~/.buildroot-ccache (298 MB)

btw. is there a way to make clean but leave compiled toolchain (i want to
compile for armhf and aarch64)?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
