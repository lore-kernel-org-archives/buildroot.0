From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Jul 2017 21:04:06 +0000
Subject: [Buildroot] [Bug 10071] [PATCH] fakeroot: replace hard-coded paths
 in post install
In-Reply-To: <bug-10071-163@https.bugs.busybox.net/>
References: <bug-10071-163@https.bugs.busybox.net/>
Message-ID: <bug-10071-163-N1oCEGkwky@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10071

--- Comment #1 from Stefan Becker <chemobejk@gmail.com> ---
Created attachment 7121
  --> https://bugs.busybox.net/attachment.cgi?id=7121&action=edit
patch for branch 2017.05.x (and older)

Older branches install fakeroot into ${HOST_DIR}/usr/bin instead of
${HOST_DIR}/bin.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
