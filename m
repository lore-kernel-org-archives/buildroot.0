From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jun 2018 13:41:10 +0000
Subject: [Buildroot] [Bug 10781] cryptsetup luksOpen container_file
 container causes libdevmapper segfault
In-Reply-To: <bug-10781-163@https.bugs.busybox.net/>
References: <bug-10781-163@https.bugs.busybox.net/>
Message-ID: <bug-10781-163-x8ZV7UtTzT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10781

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This is in fact isn't really a Buildroot issue, more an upstream issue. I'm not
a big fan of taking some random OpenWRT patch that isn't "obviously correct".

Has this issue been reported to the upstream lvm2 developers ? Or perhaps to
the uClibc-ng maintainer ? I'm sure Waldemar will be interested about a case
where a program against glibc works, but not with uClibc-ng.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
