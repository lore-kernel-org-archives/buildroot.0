From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Jan 2020 11:46:59 +0000
Subject: [Buildroot] [Bug 12481] minicom fails when output directory path
 contains "m4"
In-Reply-To: <bug-12481-163@https.bugs.busybox.net/>
References: <bug-12481-163@https.bugs.busybox.net/>
Message-ID: <bug-12481-163-qAXxtDEmjx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12481

--- Comment #2 from Giulio Benetti <giulio.benetti@benettiengineering.com> ---
Hi Heiko,

I've just tried to rebuild with gettext instead of gettext-tiny, so at the
moment
it seems a gettext-tiny problem. I'm going to dig deeper and in the meanwhile I
opened an issue on gettext-tiny Github:
https://github.com/sabotage-linux/gettext-tiny/issues/48

-- 
You are receiving this mail because:
You are on the CC list for the bug.
