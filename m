From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Jul 2009 20:38:19 +0000 (UTC)
Subject: [Buildroot] [Bug 455] Fontconfig problem problem when
	building/installing
In-Reply-To: <bug-455-163@https.bugs.busybox.net/>
References: <bug-455-163@https.bugs.busybox.net/>
Message-ID: <20090714203819.4DBE7777FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=455





--- Comment #11 from Lionel Landwerlin <lionel.landwerlin@openwide.fr>  2009-07-14 20:38:18 UTC ---
(In reply to comment #10)
> > I think we should remove the staging directory from the PATH variable, as none
> > of the binaries it contains can be executed on the host. If some package need
> > to execute one binary from another package, we should have this compiled for
> > the host.
> 
> The problem is the various *-config scripts, like sdl-config which get
> installed by various packages and *SHOULD* get called instead of whatever is
> present on the host.
> 

I'm agree, but shouldn't we provides them from the $(HOST_DIR) ?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
