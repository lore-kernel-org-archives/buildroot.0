From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 Sep 2019 14:10:13 +0000
Subject: [Buildroot] [Bug 12181] dropbear: norootlogin (-w) no longer works
 when PAM is enabled
In-Reply-To: <bug-12181-163@https.bugs.busybox.net/>
References: <bug-12181-163@https.bugs.busybox.net/>
Message-ID: <bug-12181-163-xgNGDnKSas@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12181

--- Comment #1 from Jan Dumon <jan.dumon@septentrio.com> ---
2019.08 is not affected as it uses a more recent dropbear (2019.78) and no
longer has the CVE patch.
This bug is only applicable to the LTS (2019.02.xx)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
