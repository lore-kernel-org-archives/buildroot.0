From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Apr 2010 08:07:32 +0000 (UTC)
Subject: [Buildroot] [Bug 1651] Build fail caused by ccache in
	module-init-tools
In-Reply-To: <bug-1651-163@https.bugs.busybox.net/>
References: <bug-1651-163@https.bugs.busybox.net/>
Message-ID: <20100430080732.861597F995@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1651


Paulius Zaleckas <paulius.zaleckas@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |paulius.zaleckas at gmail.com




--- Comment #3 from Paulius Zaleckas <paulius.zaleckas@gmail.com>  2010-04-30 08:07:32 UTC ---
This is because glibc static library is missing on the host.
On Fedora "yum install glibc-static" solves this problem.

However I admit that buildroot could check and report that you need to install
it.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
