From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Aug 2019 13:17:31 +0000
Subject: [Buildroot] [Bug 11881] Build breaks with lftp package enabled and
 libexpat1-dev installed on Debian 9 and Ubuntu 18.04
In-Reply-To: <bug-11881-163@https.bugs.busybox.net/>
References: <bug-11881-163@https.bugs.busybox.net/>
Message-ID: <bug-11881-163-wDn5ye1DCx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11881

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=d8011a09f741cde3e1c48edb637b91f31129a04b.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
