From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Aug 2019 06:23:36 +0000
Subject: [Buildroot] [Bug 10171] devmem2 w (word) is 8 bytes in x86 64
 systems
In-Reply-To: <bug-10171-163@https.bugs.busybox.net/>
References: <bug-10171-163@https.bugs.busybox.net/>
Message-ID: <bug-10171-163-5BHTkn15Om@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10171

--- Comment #4 from Ciro Santilli <ciro.santilli@gmail.com> ---
busybox 1.17.2 has:

Usage: devmem ADDRESS [WIDTH [VALUE]]

Read/write from physical address

        ADDRESS Address to act upon
        WIDTH   Width (8/16/...)
        VALUE   Data to be written

I forgot the original motivation, but I think this covers it?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
