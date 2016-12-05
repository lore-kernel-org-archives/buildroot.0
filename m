From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 05 Dec 2016 09:31:42 +0000
Subject: [Buildroot] [Bug 9466] VIM_REMOVE_DOCS removes rgb.txt
In-Reply-To: <bug-9466-163@https.bugs.busybox.net/>
References: <bug-9466-163@https.bugs.busybox.net/>
Message-ID: <bug-9466-163-xuc9wFbQHj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9466

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the bug report. I propose to remove /usr/share/vim/vim80/doc/
instead, and keep all the rest.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
