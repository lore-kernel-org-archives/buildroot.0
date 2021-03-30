From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 Mar 2021 19:44:09 +0000
Subject: [Buildroot] [Bug 13681] syslinux build install tools
In-Reply-To: <bug-13681-163@https.bugs.busybox.net/>
References: <bug-13681-163@https.bugs.busybox.net/>
Message-ID: <bug-13681-163-DO0UbsHCyB@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13681

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Created attachment 8841
  --> https://bugs.busybox.net/attachment.cgi?id=8841&action=edit
Draft patch installing syslinux mtools for the host

In case it helps, here is a patch I never had the time to clean up and submit
properly to Buildroot, but it does build the syslinux mtools installer for the
host.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
