From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Aug 2019 20:52:27 +0000
Subject: [Buildroot] [Bug 12131] qt5webengine builderror in the latest
 stable Buildroot 2019.05.01 version
In-Reply-To: <bug-12131-163@https.bugs.busybox.net/>
References: <bug-12131-163@https.bugs.busybox.net/>
Message-ID: <bug-12131-163-kbauXXHckg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12131

--- Comment #5 from Giulio Benetti <giulio.benetti@micronovasrl.com> ---
Ah, just checked, you need to select 'neon' instead of 'VFPv3' as fpu

-- 
You are receiving this mail because:
You are on the CC list for the bug.
