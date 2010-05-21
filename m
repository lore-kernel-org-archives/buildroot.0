From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 15:22:11 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	graph-dependencies
Message-ID: <cover.1274448102.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As requested by Peter, here is the pull request for the dependency
graph generation script.

Thomas

The following changes since commit f3122259e2cbbc0be0fc02820a146b4e4f48bef6:
  Peter Korsgaard (1):
        mtd-utils: buildsystem is broken with parallel make (regarding libubi)

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot graph-dependencies

Thomas Petazzoni (4):
      package: Add new <pkg>-show-depends to list dependencies
      Add a <fs>-root-show-depends target
      Add a show-targets target
      New graph-depends script

 Makefile                    |    3 +
 fs/common.mk                |    3 +
 package/Makefile.package.in |    3 +
 scripts/graph-depends       |  169 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 178 insertions(+), 0 deletions(-)
 create mode 100755 scripts/graph-depends

Thanks,
-- 
Thomas Petazzoni
