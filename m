From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jun 2018 13:26:10 +0000
Subject: [Buildroot] [Bug 11071] Building postgresql package on Debian 9.4
 x64 for armel target fails
In-Reply-To: <bug-11071-163@https.bugs.busybox.net/>
References: <bug-11071-163@https.bugs.busybox.net/>
Message-ID: <bug-11071-163-V2f3OhPAmp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11071

--- Comment #6 from dde at innovaphone.com ---
Created attachment 7616
  --> https://bugs.busybox.net/attachment.cgi?id=7616&action=edit
Patch for the postgresql.mk to support libxml2 if selected

This patch enables the configure option --with-libxml for PostgreSQL if libxml
is enabled.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
