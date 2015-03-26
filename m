From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Mar 2015 17:23:20 +0000 (UTC)
Subject: [Buildroot] [Bug 7976] mkuser script fails with: user already
 exists with group nogroup
In-Reply-To: <bug-7976-163@https.bugs.busybox.net/>
References: <bug-7976-163@https.bugs.busybox.net/>
Message-ID: <20150326172320.646A2818B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7976

--- Comment #2 from Tom Elliott <tommygunsster@gmail.com> 2015-03-26 17:23:20 UTC ---
I'm not seeing anything that has the nogroup that I'm installing.  I am not
installing the mysql package though.

I do have some customization's to add some of the packages we need for the
initrd file.

Weirdly enough, i've uncommented the thing and deleted the rootfs.ext file(s)
and i'm no longer able to replicate this either.

I'll do a make clean and have it run though the entire build process and upload
the log I'm generating for this.  Hopefully we'll see the problem again.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
