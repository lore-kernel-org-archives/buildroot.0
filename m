From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:14:30 +0100
Subject: [Buildroot] [PATCH] package/lua-cqueues: needs host-m4
In-Reply-To: <20181211161344.1481-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 11 Dec 2018 17:13:44 +0100")
References: <20181211161344.1481-1-thomas.petazzoni@bootlin.com>
Message-ID: <877eg96uo9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The lua-cqueues build system uses m4 during the build:
 > cd /home/test/autobuild/run/instance-1/output/build/lua-cqueues-rel-20161215/src && m4 /home/test/autobuild/run/instance-1/output/build/lua-cqueues-rel-20161215/src/errno.c.m4 >| /home/test/autobuild/run/instance-1/output/build/lua-cqueues-rel-20161215/src/errno.c.tmp

 > Therefore, the package should depend on host-m4. This has been
 > detected using per-package directory support, but a minimal defconfig
 > with just lua and lua-cqueues on a system that doesn't have m4
 > installed system-wide also exhibits the issue.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
