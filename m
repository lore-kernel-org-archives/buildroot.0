From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Jan 2020 12:18:36 +0000
Subject: [Buildroot] [Bug 12481] minicom fails when output directory path
 contains "m4"
In-Reply-To: <bug-12481-163@https.bugs.busybox.net/>
References: <bug-12481-163@https.bugs.busybox.net/>
Message-ID: <bug-12481-163-TxlR9yhxQ7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12481

--- Comment #4 from Giulio Benetti <giulio.benetti@benettiengineering.com> ---
Heiko,

you've discovered a bug that is covered at the moment, since minicom needs NLS,
then gettext(entire). So at the moment the bug is hidden.

Arnout,

thank you for pointing that. Maybe I'm going to manage it and open PR ;-)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
