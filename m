From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  6 Dec 2013 12:46:06 +0000 (UTC)
Subject: [Buildroot] [Bug 6722] Usage of $($(PKG)_DIR_PREFIX) is an issue
 with linux package
In-Reply-To: <bug-6722-163@https.bugs.busybox.net/>
References: <bug-6722-163@https.bugs.busybox.net/>
Message-ID: <20131206124606.2753A9BF4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6722

--- Comment #10 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2013-12-06 12:46:06 UTC ---
(In reply to comment #9)
> (In reply to comment #8)
> This brings up another interesting point. Should we make the $(call
> qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME) conditional on BR2_GLOBAL_PATCH_DIR
> being defined?

That sounds like a good idea to me...

> 
> Are you going submit a new version of your patches soon? I'm working on trying
> to make BR2_GLOBAL_PATCH have the ability to have multiple directories
> specified.

'soon' is relative :-)
In the mail thread of this patch, Arnout mentioned that ThomasP had a patchset
introducing a split SRC / BUILDDIR definition, which is partially related to my
patch. Just this week I asked Thomas what the status of this patch was.
I'm willing to adopt that patchset (but I haven't found it yet).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
