From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 Dec 2016 09:50:55 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-NuhQw40DQ7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #21 from bilge at scriptfusion.com ---
Yeah, I'm sorry, you're right. It doesn't really matter what order they're
built as long as `env` is only need on the target. I got confused because of
the other bug (9531) where I thought I was being told `env` was also needed *on
the target* in order to build modules. However, I believe that bug is not
related to the `env` issue at all.

Regardless, this bug can be laid to rest, although I still feel a little bad
that no change will be made to avoid someone else encountering the same
problem, even if it's just a note in the documentation.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
