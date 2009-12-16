From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 09:14:17 +0100
Subject: [Buildroot] [pull request] Pull request for branch dependencies-fix
Message-ID: <cover.1260951255.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit f3f1a94313361c251c4dfa164921d475835c763d:
  Peter Korsgaard (1):
        Merge branch 'avr32-fixes' of git://git.busybox.net/~tpetazzoni/git/buildroot

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot dependencies-fix

Thomas Petazzoni (3):
      dependencies: bail out if makeinfo isn't found
      dependencies: remove useless test doing nothing
      dependencies: cleanup

 toolchain/dependencies/dependencies.sh |  273 +++++---------------------------
 1 files changed, 38 insertions(+), 235 deletions(-)

Thanks,
-- 
Thomas Petazzoni
