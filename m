From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Aug 2009 00:37:04 +0000 (UTC)
Subject: [Buildroot] [Bug 459] libgtk2 autoreconf
In-Reply-To: <bug-459-163@https.bugs.busybox.net/>
References: <bug-459-163@https.bugs.busybox.net/>
Message-ID: <20090809003704.ACF69777FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=459





--- Comment #3 from Lionel Landwerlin <lionel.landwerlin@openwide.fr>  2009-08-09 00:37:03 UTC ---
(In reply to comment #2)
> To solve the gtk-doc.m4 problem, what do you think of
> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=gtk-doc-m4-fix&id=b53a6096e4ea53517c7de5f711f381333bd6ac11
> ?
> 

Good job !

It's going to fix most of the problems I had building my rootfs.

Please find another patch to fix the other issue when autoreconfiguring gtk+
(test directory must be disabled).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
