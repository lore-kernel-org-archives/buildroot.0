From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Aug 2020 21:07:24 +0000
Subject: [Buildroot] [Bug 13121] wpa_supplicant fails to build without
 libopenssl enabled
In-Reply-To: <bug-13121-163@https.bugs.busybox.net/>
References: <bug-13121-163@https.bugs.busybox.net/>
Message-ID: <bug-13121-163-GBSJUA7kJp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13121

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Thanks! Fixed in commit bb27efbce75071d7c9b36bc5a896d166e01c1aa1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
