From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 May 2019 08:41:43 +0000
Subject: [Buildroot] [Bug 11921] dahdi fails to build
In-Reply-To: <bug-11921-163@https.bugs.busybox.net/>
References: <bug-11921-163@https.bugs.busybox.net/>
Message-ID: <bug-11921-163-RLZQkT5kPs@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11921

--- Comment #4 from Davide Viti <zinosat@gmail.com> ---
From what I understand, the failure happens starting with kernel 4.11.x

I've run a build selecting kernel 4.10.9 and leaving dahdi 2.11.1 and it builds
fine.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
