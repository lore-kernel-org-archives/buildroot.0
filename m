From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 19 Apr 2020 18:53:07 +0000
Subject: [Buildroot] [Bug 12786] Systemd spawns two getty processes when the
 getty port is set to console
In-Reply-To: <bug-12786-163@https.bugs.busybox.net/>
References: <bug-12786-163@https.bugs.busybox.net/>
Message-ID: <bug-12786-163-YS4ojzoX66@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12786

--- Comment #2 from Adam Duskett <aduskett@gmail.com> ---
After I did a quick google search I found a post on stack exchange that
indicates this has been an issue since at least version 2019.02!

https://unix.stackexchange.com/questions/566959/how-to-prevent-console-getty-service-to-start

The logic behind /dev/console in systemd.mk is a bit complex and I am not sure
where to start.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
