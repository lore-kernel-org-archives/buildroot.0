From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jul 2010 18:15:10 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	mark-arch-as-deprecated
Message-ID: <cover.1280160874.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This resend takes into account Sam comment on the Sparc architecture,
that we don't mark as deprecated.

Thomas

The following changes since commit 3435c1afb58307240be8e4607b5bb7d239fac4e9:
  Peter Korsgaard (1):
        kconfig: implement KCONFIG_PROBABILITY for rand{,package}config

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot mark-arch-as-deprecated

Thomas Petazzoni (1):
      Deprecate the Alpha, IA64 and Sparc64 support

 target/Config.in.arch |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

Thanks,
-- 
Thomas Petazzoni
