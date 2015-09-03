From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu,  3 Sep 2015 11:01:55 +0200
Subject: [Buildroot] [PATCH 0/3] package/ltp-testsuite
Message-ID: <1441270918-28981-1-git-send-email-anders.roxell@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patchset enables the power-management and realtime tests in LTP.
and bump ltp to release 20150420.

Cheers,
Anders

Anders Roxell (3):
  package/ltp-testsuite: enable realtime tests
  package/ltp-testsuite: enable power-management tests
  package/ltp-testsuite: version bump to 20150420

 package/ltp-testsuite/ltp-testsuite.hash | 2 +-
 package/ltp-testsuite/ltp-testsuite.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.1.4
