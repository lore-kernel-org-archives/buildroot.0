From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Oct 2018 07:37:09 +0000
Subject: [Buildroot] [Bug 11411] check-uniq-files target issue
In-Reply-To: <bug-11411-163@https.bugs.busybox.net/>
References: <bug-11411-163@https.bugs.busybox.net/>
Message-ID: <bug-11411-163-yxIAsM7M8y@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11411

--- Comment #6 from Jean-pierre Cartal <jpcartal@free.fr> ---
You're correct, this is happening when I force a package reinstallation, a full
package rebuild does not trigger the issue.

However, I think that adding the -p option would still be useful to avoid this
issue when reinstalling a package.

BTW I created a separate ticket for warnings in staging area (#11416)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
