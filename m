From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 08 May 2020 09:10:41 +0000
Subject: [Buildroot] [Bug 12841] util-linux/sfdisk 2.35.1 fails on
 sector-size header
In-Reply-To: <bug-12841-163@https.bugs.busybox.net/>
References: <bug-12841-163@https.bugs.busybox.net/>
Message-ID: <bug-12841-163-UUAiJL3FjH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12841

--- Comment #1 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
Hi,

Instead of adding a custom patch, I retrieved the upstream patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20200507224150.242211-2-fontaine.fabrice at gmail.com

Can you confirm that the patch above fixes your issue?

Best Regards,

Fabrice

-- 
You are receiving this mail because:
You are on the CC list for the bug.
