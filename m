From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 27 Jul 2019 06:38:24 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_12046=5D_Can=E2=80=99t_login_as_roo?=
 =?utf-8?q?t_user_after_upgrading_to_buildroot_2019=2E02?=
In-Reply-To: <bug-12046-163@https.bugs.busybox.net/>
References: <bug-12046-163@https.bugs.busybox.net/>
Message-ID: <bug-12046-163-Y4fNBXhQVp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12046

--- Comment #3 from liadekel123 at gmail.com ---
Hey Carlos,
Sorry about the delay. We solved the problem...
Apparently the version of login in buildroot 2019.02 use securetty file which
lists all the devices root user is allowed to login from :|

Many Thanks,
Liad

-- 
You are receiving this mail because:
You are on the CC list for the bug.
