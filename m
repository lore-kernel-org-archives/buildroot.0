From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:37:26 +0200
Subject: [Buildroot] [git commit] libselinux: use correct name and
 content for patch 0004
In-Reply-To: <20180818193204.2F6708D5DA@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 18 Aug 2018 21:33:47 +0200")
References: <20180818193204.2F6708D5DA@busybox.osuosl.org>
Message-ID: <87tvnkjh2x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=cb8d1743cab1449b91afbabe38c64cbb85bef6ba
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 6288409642d8368104f916bd264d2cb042942dfa ("libselinux: add
 > patch to fix build with gcc < 4.7") introduced a patch, but its file
 > name was incorrect, so it was never applied. In addition, the patch
 > was generated against the Git repository of SELinux, which includes
 > all projects, and therefore it doesn't apply to the libselinux source
 > code extracted from the tarball: the "libselinux/" component path
 > needs to be removed from the patch.

 > This commit fixes both problems, which should finally and really fix:

 >   http://autobuild.buildroot.net/results/c3272566bb808e43bb77ec59cfe596f7e0fe9a64/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
