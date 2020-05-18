From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 May 2020 11:26:35 +0000
Subject: [Buildroot] [Bug 12901] GStreamer doesn't build on 2020-05 rc1 with
 GObject introspection enabled (wrong path for g-ir-scanner)
In-Reply-To: <bug-12901-163@https.bugs.busybox.net/>
References: <bug-12901-163@https.bugs.busybox.net/>
Message-ID: <bug-12901-163-RW64jPC23c@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12901

--- Comment #4 from info at hifiberry.com ---
Tested the b5cd3142963 commit - works now. 

Many thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
