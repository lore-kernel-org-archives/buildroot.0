From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Sep 2010 15:21:10 +0000 (UTC)
Subject: [Buildroot] [Bug 2611] New package: lame (LAME MP3 Encoder)
In-Reply-To: <bug-2611-163@https.bugs.busybox.net/>
References: <bug-2611-163@https.bugs.busybox.net/>
Message-ID: <20100920152110.186098B4FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2611

--- Comment #1 from Paul Burton <Paul.Burton@imgtec.com>  ---
Created attachment 2503
  --> https://bugs.busybox.net/attachment.cgi?id=2503
Expose GStreamer LAME plugin

Additionally, this patch adds a configuration option for the GStreamer LAME
elements from gst-plugins-ugly. It applies after the GStreamer update in bug
2605, I make no guarantees about the older version.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
