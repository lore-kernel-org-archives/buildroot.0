From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Oct 2019 08:48:54 +0000
Subject: [Buildroot] [Bug 11776] qt5webengine 5.12.2 build failed with arm
 toolchain and linaro toolchain
In-Reply-To: <bug-11776-163@https.bugs.busybox.net/>
References: <bug-11776-163@https.bugs.busybox.net/>
Message-ID: <bug-11776-163-VDv11Fyfwx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11776

--- Comment #3 from Thomas Preston <thomas.preston@codethink.co.uk> ---
Hi,
It doesn't look like this but could it be related to pkgconf, which might be
used to generate the Ninja files? We had to fix that [0] to get the correct -I
and -isystem flags.

Tom

[0] http://lists.busybox.net/pipermail/buildroot/2019-October/261276.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
