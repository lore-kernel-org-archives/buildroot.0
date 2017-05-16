From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 May 2017 19:42:31 +0000
Subject: [Buildroot] [Bug 9866] BASE_DIR usage
In-Reply-To: <bug-9866-163@https.bugs.busybox.net/>
References: <bug-9866-163@https.bugs.busybox.net/>
Message-ID: <bug-9866-163-RBamnavnD1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9866

--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Yann E. MORIN from comment #5)

Ahh yes, as you can see I don't use BR2_EXTERNAL (and local.mk normally doesn't
matter for a post-build / post-image script).

Grepping the linux and u-boot sources, I do see some references to CONFIG_DIR
though, so we have to be careful.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
