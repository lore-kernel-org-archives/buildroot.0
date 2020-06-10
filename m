From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jun 2020 21:32:52 +0000
Subject: [Buildroot] [Bug 12971] qt5webengine: graph-depends seems producing
 incorrect output
In-Reply-To: <bug-12971-163@https.bugs.busybox.net/>
References: <bug-12971-163@https.bugs.busybox.net/>
Message-ID: <bug-12971-163-f2LLW4zVM6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12971

--- Comment #4 from Peter Seiderer <ps.report@gmx.net> ---
qt5declarative (and with it qt5declarative-quick) is a compile time
dependency, only qt5quickcontrols and qt5quickcontrols2 are the runtime
dependencies (which is o.k. as the quickcontrols are normally only
referenced from qml/runtime and the c++ code/libs by plugin loading)...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
