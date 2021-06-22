From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 22 Jun 2021 02:25:55 +0000
Subject: [Buildroot] [Bug 13866] host-go: not supported on arm64 hosts
In-Reply-To: <bug-13866-163@https.bugs.busybox.net/>
References: <bug-13866-163@https.bugs.busybox.net/>
Message-ID: <bug-13866-163-VsZ3JxyHRl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13866

Christian Stewart <christian@paral.in> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christian at paral.in

--- Comment #1 from Christian Stewart <christian@paral.in> ---
Created attachment 9011
  --> https://bugs.busybox.net/attachment.cgi?id=9011&action=edit
The attached patch configures host-go package to use the host /usr/bin/go
compiler to bootstrap Golang when go-bootstrap is not supported (i.e. arm64).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
