From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  9 Jun 2009 18:58:57 +0000 (UTC)
Subject: [Buildroot] [Bug 383] gst-plugins-good: Allow soup plugin to be
	configured
In-Reply-To: <bug-383-163@https.bugs.busybox.net/>
References: <bug-383-163@https.bugs.busybox.net/>
Message-ID: <20090609185857.27249777B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=383





--- Comment #1 from Markus Heidelberg <markus.heidelberg@web.de>  2009-06-09 18:58:56 UTC ---
We use the exact name of the plugin in Config.in, the name which is used on the
command line with gst-launch for example. It is written in the configure help
of the gst package. So "souphttpsrc" instead of "soup" and BR2_..._SOUPHTTPSRC. 

Also, the short description should be a bit more descriptive. Why not just take
it from configure: soup http client plugin (2.4)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
