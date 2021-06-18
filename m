From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Jun 2021 18:29:14 +0000
Subject: [Buildroot] [Bug 13661] host-python2 build fails on aarch64
In-Reply-To: <bug-13661-163@https.bugs.busybox.net/>
References: <bug-13661-163@https.bugs.busybox.net/>
Message-ID: <bug-13661-163-htjansdti4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13661

--- Comment #4 from Erico Nunes <nunes.erico@gmail.com> ---
Created attachment 9006
  --> https://bugs.busybox.net/attachment.cgi?id=9006&action=edit
0001-python-use-system-libffi-for-host-python.patch

I remember seeing this a while back. I looked a bit into the problem back then
and solved it with the attached patch.
I never went around to fully testing it and submitting it to the list.
If it solves the problem for you, feel free to take it and submit it to the
list.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
