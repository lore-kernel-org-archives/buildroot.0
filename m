From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Mar 2012 14:40:11 +0000 (UTC)
Subject: [Buildroot] [Bug 4958] Qt 4.7.4 build crashes with Linux 2.6.29
In-Reply-To: <bug-4958-163@https.bugs.busybox.net/>
References: <bug-4958-163@https.bugs.busybox.net/>
Message-ID: <20120321144011.BD61B95415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4958

--- Comment #2 from J?r?mie Scheer <jeremie.scheer@armadeus.com> 2012-03-21 14:40:11 UTC ---
Created attachment 4178
  --> https://bugs.busybox.net/attachment.cgi?id=4178
Omit accept4 when not supported by the kernel.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
