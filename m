From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 May 2017 16:03:20 +0000
Subject: [Buildroot] [Bug 9866] BASE_DIR usage
In-Reply-To: <bug-9866-163@https.bugs.busybox.net/>
References: <bug-9866-163@https.bugs.busybox.net/>
Message-ID: <bug-9866-163-eF8g7OLPti@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9866

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
According to the Buildroot manual:

"Again just like for the post-build scripts, the scripts have access to the
environment variables BR2_CONFIG, HOST_DIR, STAGING_DIR, TARGET_DIR, BUILD_DIR,
BINARIES_DIR and BASE_DIR."

So why bother re-running make printvars to get BASE_DIR, if it's already
available in the environment?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
