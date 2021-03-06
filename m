From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 06 Mar 2021 11:31:23 +0000
Subject: [Buildroot] [Bug 13576] Issues compiling buildroot for 5x86
In-Reply-To: <bug-13576-163@https.bugs.busybox.net/>
References: <bug-13576-163@https.bugs.busybox.net/>
Message-ID: <bug-13576-163-kXE16ACdSu@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13576

--- Comment #6 from Peter Seiderer <ps.report@gmx.net> ---
Regarding Description - Point 3) - rust binary/missing hash:

Fixed by

https://patchwork.ozlabs.org/project/buildroot/patch/20210306112307.28337-1-ps.report at gmx.net/

The dependency is by package ripgrep --> host-rustc --> host-rust-bin (take a
look at 'make graph-depends' buildroot feature)...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
