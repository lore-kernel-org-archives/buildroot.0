From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 May 2020 07:06:18 +0000
Subject: [Buildroot] [Bug 12611] ntp hash is not matching with upstream
 4.2.8p13
In-Reply-To: <bug-12611-163@https.bugs.busybox.net/>
References: <bug-12611-163@https.bugs.busybox.net/>
Message-ID: <bug-12611-163-d48b3Y9AZd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12611

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
2020.02.x is now using ntp 4.2.8p14, and its hash looks good:

ntp-4.2.8p14.tar.gz: OK (md5: 783edaf1d68ddf651bde64eda54a579d)
ntp-4.2.8p14.tar.gz: OK (sha256:
1960e4f081f6aafd108d721bc3ab15f9e8dfd08dc08339aa95bca9d2545e4eb7)

So, the issue is fixed with the bump to 4.2.8p14.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
