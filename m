From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 03 May 2021 02:59:56 +0000
Subject: [Buildroot] [Bug 13651] pkg-golang cannot build when main.go is in
 the root
In-Reply-To: <bug-13651-163@https.bugs.busybox.net/>
References: <bug-13651-163@https.bugs.busybox.net/>
Message-ID: <bug-13651-163-EU6mggMr7F@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13651

Christian Stewart <christian@paral.in> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Christian Stewart <christian@paral.in> ---
It appears that now Golang supports build targets ending in "/." so this is
resolved without action.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
