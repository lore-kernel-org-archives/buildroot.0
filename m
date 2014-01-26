From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Jan 2014 21:59:42 +0100
Subject: [Buildroot] [PATCH] gtest: force static library build
In-Reply-To: <1390577064-16525-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Fri, 24 Jan 2014 16:24:24 +0100")
References: <1390577064-16525-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87fvoa1mtd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > While it seems possible to build gtest as a shared library, using it
 > in other projects requires to set some specific configuration flags
 > in these projects for correctly linking against the shared version
 > of the gtest library.

 > So, to avoid bothering many projects and keep things as they were so
 > far, we just force gtest to be built as a static library.

 > Fixes:
 >   http://autobuild.buildroot.net/results/20cbf90749672607cb277c676a45d2c0c3965fa0/
 >   http://autobuild.buildroot.net/results/5c6e58c51b2a14a7f23d296f771a76096b80362a/
 >   http://autobuild.buildroot.net/results/bde777d343e9c4884272893d0da3b113dcc75e3a/
 >   http://autobuild.buildroot.net/results/20cbf90749672607cb277c676a45d2c0c3965fa0/
 >   http://autobuild.buildroot.net/results/89a29d1f597dbc12a6fc8eb079133a84952fc612/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
