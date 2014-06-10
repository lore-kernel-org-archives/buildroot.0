From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Jun 2014 12:09:53 +0000 (UTC)
Subject: [Buildroot] [Bug 7184] supervisord depends on libxml2 implicitly
In-Reply-To: <bug-7184-163@https.bugs.busybox.net/>
References: <bug-7184-163@https.bugs.busybox.net/>
Message-ID: <20140610120953.666229C49F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7184

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-06-10 12:09:53 UTC ---
I made a build for qemu with only supervisord, and during boot I get another
error:

Starting supervisord: Traceback (most recent call last):
  File "/usr/bin/supervisord", line 5, in <module>
    from pkg_resources import load_entry_point
ImportError: No module named pkg_resources

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
