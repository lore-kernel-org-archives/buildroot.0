From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Dec 2011 10:04:43 +0000 (UTC)
Subject: [Buildroot] [Bug 4622] Unable to download properly file
	fakeroot_1.9.5.tar.gz
In-Reply-To: <bug-4622-163@https.bugs.busybox.net/>
References: <bug-4622-163@https.bugs.busybox.net/>
Message-ID: <20111219100443.AA9308F931@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4622

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> 2011-12-19 10:04:43 UTC ---
(In reply to comment #3)
> Sorry, I forgot to attach the file...
> 
> This is the file downloaded during default "make build"

Ok, that looks like the frontpage of snapshot.debian.org. Could you show the
exact output of the download step (E.G. the wget invocation)? (rm
dl/fakeroot_1.9.5.tar.gz; make)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
