From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 27 Jul 2019 20:45:01 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_12046=5D_Can=E2=80=99t_login_as_roo?=
 =?utf-8?q?t_user_after_upgrading_to_buildroot_2019=2E02?=
In-Reply-To: <bug-12046-163@https.bugs.busybox.net/>
References: <bug-12046-163@https.bugs.busybox.net/>
Message-ID: <bug-12046-163-eEQ121lVF2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12046

--- Comment #4 from Carlos Santos <unixmania@gmail.com> ---
(In reply to liadekel123 from comment #3)

/etc/securetty is required by pam_securetty, which is part of pam-linux. It is
not used by default neither by the busybox login nor by the util-linux one.
What
is the contents of your /etc/pam.d/login file?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
