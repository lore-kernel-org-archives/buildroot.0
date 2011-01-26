From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jan 2011 17:13:32 +0000 (UTC)
Subject: [Buildroot] [Bug 3145] jffs2 image generation fails
In-Reply-To: <bug-3145-163@https.bugs.busybox.net/>
References: <bug-3145-163@https.bugs.busybox.net/>
Message-ID: <20110126171332.4B5678B52C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3145

--- Comment #4 from Michael J. Hammel <mjhammel@graphics-muse.org>  ---
I didn't know you could link a static lib with -L<path> -l<lib>.  I always that
was for shared libraries only.  If not, I learned something new today. :-)

But if you can reference a static lib that way then the -L path was properly
set because the static library was already in the same place the shared library
ended up.  Which makes me think it wasn't related to the -L options.  

Anyway, it's an older release issue.  If I can get my 05 config to work with a
newer release I'll reverify this is working with the updated mtd.  

Thanks for the quick reply!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
