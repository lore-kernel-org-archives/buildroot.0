From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  6 Dec 2014 20:23:58 +0000 (UTC)
Subject: [Buildroot] [Bug 7556] make interactive CLI optional for nftables
In-Reply-To: <bug-7556-163@https.bugs.busybox.net/>
References: <bug-7556-163@https.bugs.busybox.net/>
Message-ID: <20141206202358.DB89E800F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7556

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-12-06 20:23:58 UTC ---
(In reply to comment #2)
> Looks like someone has beaten me to it:
> 
> http://marc.info/?l=netfilter-devel&m=141288774531750&w=2

Thanks for following up on this. So you know have several options:

 1/ Wait for upstream to make a new release, and once this is done, send a
patch to Buildroot to update to the latest version.

 2/ Send a patch right now to update Buildroot to the latest Git version of
nftables, and then later send a patch to do (1) once an upstream release is
made.

 3/ Send a patch to Buildroot that adds the patch you pointed in
package/nftables/, after having backported it to the version of nftables
currently used in Buildroot.

If you can't wait, (2) is probably the easiest option.

Since this bug really isn't a bug, but more a feature request about an upstream
package rather than Buildroot itself, I'll mark it as "invalid". Please don't
take this as a "we don't care" message: we are definitely looking forward for
your patches on this topic, as being able to disable readline support is
definitely useful.

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
