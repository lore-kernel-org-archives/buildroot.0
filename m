From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  7 Dec 2013 11:19:50 +0000 (UTC)
Subject: [Buildroot] [Bug 6722] Usage of $($(PKG)_DIR_PREFIX) is an issue
 with linux package
In-Reply-To: <bug-6722-163@https.bugs.busybox.net/>
References: <bug-6722-163@https.bugs.busybox.net/>
Message-ID: <20131207111950.51A8A9BF4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6722

--- Comment #11 from Ryan Barnett <rjbarnet@rockwellcollins.com> 2013-12-07 11:19:49 UTC ---
(In reply to comment #10)
> (In reply to comment #9)
> > Are you going submit a new version of your patches soon? I'm working on trying
> > to make BR2_GLOBAL_PATCH have the ability to have multiple directories
> > specified.
> 
> 'soon' is relative :-)
> In the mail thread of this patch, Arnout mentioned that ThomasP had a patchset
> introducing a split SRC / BUILDDIR definition, which is partially related to my
> patch. Just this week I asked Thomas what the status of this patch was.
> I'm willing to adopt that patchset (but I haven't found it yet).

As I mentioned, I'm working on BR2_GLOBAL_PATCH_DIR have the ability to have
multiple directories which will conflict with the patches you mentioned
earlier. I will see if I can poke Thomas P on your behalf so we can figure out
a way to coordinate my changes with yours since they will be conflicting.

Here is an early preview of what I've been working on.

https://github.com/rjbarnet/buildroot/compare/master...multiple-patch-dir

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
