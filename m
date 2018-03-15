From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Mar 2018 03:43:13 +0000
Subject: [Buildroot] [Bug 10851] Patch to handle numpad Enter key properly
In-Reply-To: <bug-10851-163@https.bugs.busybox.net/>
References: <bug-10851-163@https.bugs.busybox.net/>
Message-ID: <bug-10851-163-j5WOreD5Jw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10851

--- Comment #2 from Igor Liferenko <igor.liferenko@gmail.com> ---
Hi,

I did a quick investigation and created this patch myself, because I could not
use numpad enter key while configuring openwrt. And as I read on openwrt
website that they use buildroot, I filed this bug report here. I did not submit
this patch to anywhere except here.

Please help me to figure out if I should post this patch to Linux kconfig or to
openwrt. Or could you please just add these changes yourself, the way it seems
more appropriate. Just to make that numpad enter key work the same way as
ordinary enter key in "make menuconfig".

Thanks,
Igor

-- 
You are receiving this mail because:
You are on the CC list for the bug.
