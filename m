From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Nov 2016 20:59:13 +0000
Subject: [Buildroot] [Bug 9436] e2fsprogs remove busybox applets even of
 unselected e2fsprogs components
In-Reply-To: <bug-9436-163@https.bugs.busybox.net/>
References: <bug-9436-163@https.bugs.busybox.net/>
Message-ID: <bug-9436-163-qNOdrgQV4g@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9436

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Yes, indeed. The E2FSPROGS_REMOVE_BUSYBOX_APPLETS logic in e2fsprogs.mk must be
improved to remove the Busybox version only if the corresponding e2fsprogs
program is enabled.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
