From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Nov 2019 20:40:08 +0000
Subject: [Buildroot] [Bug 12196] duma package
In-Reply-To: <bug-12196-163@https.bugs.busybox.net/>
References: <bug-12196-163@https.bugs.busybox.net/>
Message-ID: <bug-12196-163-WgqqMPdgCA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12196

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NEEDINFO

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Run "ulimit -c unlimited" before starting duma, and you will get a core dump.

Which Marvell processor are you using ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
