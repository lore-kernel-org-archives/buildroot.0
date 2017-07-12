From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Jul 2017 07:51:47 +0000
Subject: [Buildroot] [Bug 10036] Buildroot builds Raspbian Jessie headless
 image presenting incorrect prompt
In-Reply-To: <bug-10036-163@https.bugs.busybox.net/>
References: <bug-10036-163@https.bugs.busybox.net/>
Message-ID: <bug-10036-163-QRI3MthBRU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10036

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Paul, I think you are very confused about what Buildroot and what Raspbian are.
Buildroot and Raspbian have nothing in common, and trying to "build" Raspbian
with Buildroot doesn't make any sense at all.

Buildroot is an embedded Linux build system, to build highly customized Linux
systems by cross-compilation. It does not build Linux distributions with binary
packages, but just a root filesystem image, with no package management system
at all.

Raspbian is based on Debian, and provides a full-featured Linux distribution,
with a package management system.

There is simply no way Buildroot can be used to "produce" Raspbian.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
