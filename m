From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Nov 2019 18:58:48 +0000
Subject: [Buildroot] [Bug 12316] tzdata fails to install with empty "default
 local time"
In-Reply-To: <bug-12316-163@https.bugs.busybox.net/>
References: <bug-12316-163@https.bugs.busybox.net/>
Message-ID: <bug-12316-163-sokiTLebHR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12316

--- Comment #1 from Andrew Trapani <andrew.trapani@ontera.bio> ---
Created attachment 8281
  --> https://bugs.busybox.net/attachment.cgi?id=8281&action=edit
Config with Etc/UTC installed (tzdata completes)

.config file saved from menuconfig with default local time set to Etc/UTC

Warning: This config references local paths and to local things, and won't
build for you.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
