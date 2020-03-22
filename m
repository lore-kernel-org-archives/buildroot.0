From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Mar 2020 19:51:47 +0000
Subject: [Buildroot] [Bug 12691] host-rust build fails
In-Reply-To: <bug-12691-163@https.bugs.busybox.net/>
References: <bug-12691-163@https.bugs.busybox.net/>
Message-ID: <bug-12691-163-K5itBhBbB6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12691

--- Comment #1 from alex at corcoles.net ---
Hi,

What arch/libc are you using? Only some combinations of those work (I think
only glibc). Check out:

http://buildroot-busybox.2317881.n4.nabble.com/PATCH-hack-to-be-able-to-build-Rust-targetting-MIPS-tp244931p244957.html

Cheers,

?lex

-- 
You are receiving this mail because:
You are on the CC list for the bug.
