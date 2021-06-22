From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 22 Jun 2021 02:27:05 +0000
Subject: [Buildroot] [Bug 13866] host-go: not supported on arm64 hosts
In-Reply-To: <bug-13866-163@https.bugs.busybox.net/>
References: <bug-13866-163@https.bugs.busybox.net/>
Message-ID: <bug-13866-163-1OqcMXqoy7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13866

Christian Stewart <christian@paral.in> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #9011|The attached patch          |0001-package-go-use-host-co
        description|configures host-go package  |mpiler-when-go-bootstrap-un
                   |to use the host /usr/bin/go |supported.patch
                   |compiler to bootstrap       |
                   |Golang when go-bootstrap is |
                   |not supported (i.e. arm64). |

--- Comment #2 from Christian Stewart <christian@paral.in> ---
Comment on attachment 9011
  --> https://bugs.busybox.net/attachment.cgi?id=9011
0001-package-go-use-host-compiler-when-go-bootstrap-unsupported.patch

The attached patch configures host-go package to use the host /usr/bin/go
compiler to bootstrap Golang when go-bootstrap is not supported (i.e. arm64).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
