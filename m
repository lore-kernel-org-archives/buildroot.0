From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Nov 2019 07:58:38 +0000
Subject: [Buildroot] [Bug 12331] meson issue
In-Reply-To: <bug-12331-163@https.bugs.busybox.net/>
References: <bug-12331-163@https.bugs.busybox.net/>
Message-ID: <bug-12331-163-kl98Y7orpd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12331

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Looking back at this, your path
"/home/Dev/Ssd/buildroot/buildroot-2019.02.7/host/bin/python3" is not that
long, it's only 61 bytes long. This shouldn't cause a problem, the maximum
shebang line is 128 bytes.

So I'm not sure why you think the length of the path is a problem. Could you
give more details about the error you're seeing ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
