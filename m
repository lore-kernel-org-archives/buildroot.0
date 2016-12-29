From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Dec 2016 13:24:34 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-HZSIZ8Im0w@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Isn't this a docker-specific issue, see
https://github.com/docker/docker/issues/27940 ?

Please provide a way of reproducing this without all the Docker related
complexity. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
