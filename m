From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Aug 2010 14:03:42 +0000 (UTC)
Subject: [Buildroot] [Bug 2359] [luafilesystem] remove LARGE_FILE constraint
In-Reply-To: <bug-2359-163@https.bugs.busybox.net/>
References: <bug-2359-163@https.bugs.busybox.net/>
Message-ID: <20100811140342.855EC873CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2359

--- Comment #2 from Fran?ois Perrad <francois.perrad@gadz.org>  ---
(In reply to comment #1)
> Let's get the opinion of Gustavo, who is following our Lua packages in
> Buildroot.
> 
> Fran?ois, has the patch against luafilesystem that you're proposing been
> proposed to upstream ?

Thomas, no. Because my patch is just a workaround for BuildRoot
(which moves some defines from lfs.c to luafilesystem.mk).

But I create a ticket, see
http://github.com/keplerproject/luafilesystem/issues/issue/1.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
