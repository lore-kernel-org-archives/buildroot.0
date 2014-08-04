From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  4 Aug 2014 08:25:22 +0000 (UTC)
Subject: [Buildroot] [Bug 7286] systemd 215 doesn't build
In-Reply-To: <bug-7286-163@https.bugs.busybox.net/>
References: <bug-7286-163@https.bugs.busybox.net/>
Message-ID: <20140804082522.6675F9D28A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7286

--- Comment #7 from Eric Le Bihan <eric.le.bihan.dev@free.fr> 2014-08-04 08:25:22 UTC ---
Created attachment 5552
  --> https://bugs.busybox.net/attachment.cgi?id=5552
Workaround by disabling link time optimization

Here is a workaround which disable link time optimization for systemd.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
