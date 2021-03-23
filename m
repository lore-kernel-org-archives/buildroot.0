From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Mar 2021 20:45:41 +0000
Subject: [Buildroot] [Bug 13671] openSSH server closes connection before
 authentication is finished
In-Reply-To: <bug-13671-163@https.bugs.busybox.net/>
References: <bug-13671-163@https.bugs.busybox.net/>
Message-ID: <bug-13671-163-M6VDxm9dmC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13671

--- Comment #3 from Peter Seiderer <ps.report@gmx.net> ---
Additional/similar bug report:

https://bugs.busybox.net/show_bug.cgi?id=13626

Older OpenSSH login problem report:

http://lists.busybox.net/pipermail/buildroot/2020-August/289111.html
http://lists.busybox.net/pipermail/buildroot/2020-September/291853.html

Dropbear login problem with password and BR2_TARGET_GENERIC_PASSWD_SHA512:

http://lists.busybox.net/pipermail/buildroot/2020-August/288682.html

By the way, you disabled BR2_TARGET_ENABLE_ROOT_LOGIN, how did you setup the
root and/or test account/password?

And another reported OpenSSH login problem:

http://lists.busybox.net/pipermail/buildroot/2020-August/289111.html
http://lists.busybox.net/pipermail/buildroot/2020-September/291379.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
