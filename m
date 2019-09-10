From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Sep 2019 00:01:23 +0000
Subject: [Buildroot] [Bug 10806] Allow nfs-utils to use ipv6
In-Reply-To: <bug-10806-163@https.bugs.busybox.net/>
References: <bug-10806-163@https.bugs.busybox.net/>
Message-ID: <bug-10806-163-1fJxeu3hnJ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10806

--- Comment #5 from Carlos Santos <unixmania@gmail.com> ---
Discussing the subject in the mailing list it was decided to keep libtirpc
optional so I submitted a second patch that builds nfs-utils with IPv6 enabled
if libtirpc is selected:

https://patchwork.ozlabs.org/patch/1159968/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
