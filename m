From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Oct 2019 07:17:56 +0000
Subject: [Buildroot] [Bug 12281] Custom configuration fails to build (based
 on raspberrypi3_defconfig)
In-Reply-To: <bug-12281-163@https.bugs.busybox.net/>
References: <bug-12281-163@https.bugs.busybox.net/>
Message-ID: <bug-12281-163-EBXUhAo26H@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12281

--- Comment #2 from Paulo Matos <pmatos@igalia.com> ---
Apologies for missing the attachment of .config although it seems the problem
is in qemu 3.1.1 so any build of that package fails. I have updated buildroot
to use qemu 4.1.0 and it works. Would this be something that can be sent in as
a patch?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
