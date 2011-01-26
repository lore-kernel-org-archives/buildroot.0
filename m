From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jan 2011 16:17:46 +0000 (UTC)
Subject: [Buildroot] [Bug 3145] jffs2 image generation fails
In-Reply-To: <bug-3145-163@https.bugs.busybox.net/>
References: <bug-3145-163@https.bugs.busybox.net/>
Message-ID: <20110126161746.2239A8D3CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3145

--- Comment #2 from Michael J. Hammel <mjhammel@graphics-muse.org>  ---
Created attachment 2893
  --> https://bugs.busybox.net/attachment.cgi?id=2893
Patch for mkfs.ubifs to reference libubi as object module instead of shared lib

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
