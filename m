From: Konrad Schwarz <konrad.schwarz@siemens.com>
Date: Thu, 31 Dec 2020 22:29:46 +0100
Subject: [Buildroot] [PATCH 0/3] package/environment-setup: minor
 improvements to
Message-ID: <20201231212949.2415485-1-konrad.schwarz@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First patch is to the manual; the wrong file name is used here.

Other fixes:
a) make use of host/environment-setup idempotent;
i.e., PATH is extended only when necessary.
b) Slim the shell code down a little bit and make the
generated file host/environment-setup easier to read.

Konrad Schwarz (3):
  package/environment-setup: fix spelling of the script file in the
    manual.
  package/environment-setup: make script idempotent
  package/environment-setup: improve legibility

 docs/manual/using-buildroot-toolchain.txt     |  4 +-
 .../environment-setup/environment-setup.mk    | 63 ++++++++++---------
 2 files changed, 35 insertions(+), 32 deletions(-)

-- 
2.25.4
