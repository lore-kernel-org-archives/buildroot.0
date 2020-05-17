From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 May 2020 09:06:27 +0000
Subject: [Buildroot] [Bug 12911] usb_modeswitch installation race condition
In-Reply-To: <bug-12911-163@https.bugs.busybox.net/>
References: <bug-12911-163@https.bugs.busybox.net/>
Message-ID: <bug-12911-163-Av1XhTN5zZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12911

--- Comment #1 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
Hi,

Thanks for your bug report and for pointing out a potential solution. You can
find a patch fixing this issue here:
https://patchwork.ozlabs.org/project/buildroot/patch/20200517090528.1724124-1-fontaine.fabrice at gmail.com/

However, instead of disabling parallel install, I updated the install target to
avoid rebuilding usb_modeswitch_dispatcher during the install step.

Can you confirm that this solution is also acceptable and fix your issue?

Best Regards,

Fabrice

-- 
You are receiving this mail because:
You are on the CC list for the bug.
