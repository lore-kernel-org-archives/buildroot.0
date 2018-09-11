From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Sep 2018 19:53:39 +0000
Subject: [Buildroot] [Bug 11341] Compiling qt5base-5.11.1 with libressl
 results in many 'was not declared in this scope' errors
In-Reply-To: <bug-11341-163@https.bugs.busybox.net/>
References: <bug-11341-163@https.bugs.busybox.net/>
Message-ID: <bug-11341-163-tcxAu4MfRh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11341

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
There exits a freebsd provided patch to support libressl, see [1]/[2], but
declined upstream, see [3].

[1] https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=228344
[2] https://bz-attachments.freebsd.org/attachment.cgi?id=196994
[3] https://bugreports.qt.io/browse/QTBUG-68374

-- 
You are receiving this mail because:
You are on the CC list for the bug.
