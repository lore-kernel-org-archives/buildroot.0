From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Oct 2016 09:42:50 +0000
Subject: [Buildroot] [Bug 9341] avahi-utils does not compile with uClibc +
	libglib2
In-Reply-To: <bug-9341-163@https.bugs.busybox.net/>
References: <bug-9341-163@https.bugs.busybox.net/>
Message-ID: <bug-9341-163-oRtedoLhD2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9341

--- Comment #1 from Johan Oudinet <johan.oudinet@gmail.com> ---
Created attachment 6751
  --> https://bugs.busybox.net/attachment.cgi?id=6751&action=edit
Add libintl if libglib2 is enabled

I may have a solution (see attached patch).
It does fix the compilation error in my case but I'm not sure it doesn't
compile with libintl too often.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
