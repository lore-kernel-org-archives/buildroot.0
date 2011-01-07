From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Jan 2011 17:36:57 +0000 (UTC)
Subject: [Buildroot] [Bug 2869] Do not erase source and build directories
 from the linux kernel build.
In-Reply-To: <bug-2869-163@https.bugs.busybox.net/>
References: <bug-2869-163@https.bugs.busybox.net/>
Message-ID: <20110107173657.2F0B68A301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2869

--- Comment #2 from Marcelo Roberto Jimenez <mroberto@cpti.cetuc.puc-rio.br>  ---
I agree, although this is a method suggested in various places, those links are
just a convenient way to find where are both the source and build directories
given just the target directory. In buildroot we know those in advance, so
there is really no need for the links.

The kernel module is a piece of software made in my work, so there is no big
deal changing it.

With the help of the linux-fusion example, it was really easy to set up things.
Maybe I didn't look at the right places, but I have missed this example
completely.

Thanks for your reply, it did help a lot. Please disregard my patch, I consider
the issue closed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
