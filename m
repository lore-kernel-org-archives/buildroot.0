From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 Jul 2019 18:05:58 +0000
Subject: [Buildroot] [Bug 11766] Console (getty) issues with systemd
In-Reply-To: <bug-11766-163@https.bugs.busybox.net/>
References: <bug-11766-163@https.bugs.busybox.net/>
Message-ID: <bug-11766-163-Py1QUjFtES@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11766

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |unixmania at gmail.com
                   |.org                        |
             Status|NEW                         |ASSIGNED

--- Comment #2 from Carlos Santos <unixmania@gmail.com> ---
Hello,

The change you proposed does not seem to be required for other boards beyond
Raspberry Pi 3. The best solution may be adding a post-buid script to patch
serial-getty at .service. There is already a board/raspberrypi/post-build.sh.

Would you mind submitting a patch?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
