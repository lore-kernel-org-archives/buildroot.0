From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Feb 2010 12:28:48 +0100
Subject: [Buildroot] .gitignore in BR archives
In-Reply-To: <4B6D8476.8050308@free.fr> (Julien Boibessot's message of "Sat,
	06 Feb 2010 16:02:14 +0100")
References: <4B6D8476.8050308@free.fr>
Message-ID: <87bpg1thcf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:

 Julien> Hello,
 Julien> in the BR tarballs (recent releases or daily snapshots), got from here:
 Julien> http://www.buildroot.org/download.html , there is a .gitignore file at
 Julien> the top of the directory hierarchy.
 Julien> Is this something you need or can it be removed for the next tarball
 Julien> releases ? (It can be problematic when de-archiving BR in already git
 Julien> versioned dirs.)

It's not that you *REALLY* need it, but it's nice if you're using git as
the git status output isn't cluttered.

I don't think it bothers people, so I would prefer to keep it in the
tarball (we would need to do special handling to remove it). Other
git-using projects like the Linux kernel also ships their .gitignore.

-- 
Bye, Peter Korsgaard
