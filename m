From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 14 Jan 2019 14:06:47 +0000
Subject: [Buildroot] [Bug 11616] 2018.02.09 fails to build libzlib with full
 RELRO protection
In-Reply-To: <bug-11616-163@https.bugs.busybox.net/>
References: <bug-11616-163@https.bugs.busybox.net/>
Message-ID: <bug-11616-163-x3MzpmilVe@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11616

--- Comment #7 from Matt Weber <matthew.weber@rockwellcollins.com> ---
If you did need to do full RELRO, you could pull the following commits in on
your LTS to change the toolchain-wrapper behavior.

git cherry-pick d4f5801027f3329fb6c2cd096f3396d3cd067390 
01d8a0a9455f9408819d7f135fba5139f0672507
7484c1c3b8065d6f2f5a67607e9917ecfea022eb
f10822d151085bcbfecd0ecf2542ac5f5623fd9d 


Care to mark this one closed?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
