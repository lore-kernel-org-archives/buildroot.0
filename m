From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Sep 2019 00:29:23 +0000
Subject: [Buildroot] [Bug 12241] Permission denied while running "make"
In-Reply-To: <bug-12241-163@https.bugs.busybox.net/>
References: <bug-12241-163@https.bugs.busybox.net/>
Message-ID: <bug-12241-163-ZbFLJnIVra@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12241

--- Comment #3 from Carlos Santos <unixmania@gmail.com> ---
(In reply to Cerem Cem ASLAN from comment #2)

Is your /tmp mounted with "noexec" option? What's the output of the command

    mount | grep -F /tmp

-- 
You are receiving this mail because:
You are on the CC list for the bug.
