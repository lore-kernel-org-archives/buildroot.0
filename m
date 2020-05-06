From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 May 2020 19:52:36 +0000
Subject: [Buildroot] [Bug 12831] RPI-firmware package: DTB-overlay dependency
In-Reply-To: <bug-12831-163@https.bugs.busybox.net/>
References: <bug-12831-163@https.bugs.busybox.net/>
Message-ID: <bug-12831-163-JXfCuLDkVF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12831

--- Comment #2 from Melanie <melanie@trash-mail.com> ---
Okay interesting, thanks for the explanation.
Do you prefer to keep it as is?

After reading the links in your comment, I still believe that changing the
dependency to 'BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT' (and enabling this config
option in all raspberrypi-defconfigs) is a more "correct" approach ...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
