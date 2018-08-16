From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 16 Aug 2018 03:01:52 +0000
Subject: [Buildroot] [Bug 11191] xattr and check-package issue
In-Reply-To: <bug-11191-163@https.bugs.busybox.net/>
References: <bug-11191-163@https.bugs.busybox.net/>
Message-ID: <bug-11191-163-g5xIiWtJZw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11191

Ricardo Martincoski <ricardo.martincoski@datacom.com.br> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #3 from Ricardo Martincoski <ricardo.martincoski@datacom.com.br> ---
Fixed in the 2018.02.x branch:
https://git.buildroot.org/buildroot/commit/?h=2018.02.x&id=1369d30a99234b256c9b5bed08d7764393ccd09f
This commit will be part of the next 2018.02.5 release.

The same fix was applied to 2018.05.x and master branches, but on those
branches there is another xattr issue that I found while fixing this one:
https://bugs.busybox.net/show_bug.cgi?id=11216

-- 
You are receiving this mail because:
You are on the CC list for the bug.
