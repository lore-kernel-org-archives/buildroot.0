From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 09 Nov 2020 22:13:41 +0000
Subject: [Buildroot] [Bug 13296] host-libcap failed to build
In-Reply-To: <bug-13296-163@https.bugs.busybox.net/>
References: <bug-13296-163@https.bugs.busybox.net/>
Message-ID: <bug-13296-163-mj8DaidVze@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13296

--- Comment #10 from Peter Seiderer <ps.report@gmx.net> ---
Same failure here (openSUSE Tumbleweed), both attached patches did not work...,
reverting 8d38eb052e7006b6e74e9453351d7f245144481e worked...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
