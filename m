From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 12:53:39 +0200
Subject: [Buildroot] [PATCH buildroot-test 0/9] several refactoring of
 daily-mail
Message-ID: <20190804105348.26660-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch-series adds several improvements to the daily-mail script
in order to keep it clean when additional functionalities will be
added (outdated packages notification and gitlab-ci failed tests
notification).


Victor Huesca (9):
  utils/daily-mail: make the script flake8 compliant
  utils/daily-mail: replace function's comments by doc-strings
  utils/daily-mail: add a function to shrink strings to a fixed size
  utils/daily-mail: remove the unnecessary 'get_notification_for_dev'
    function
  utils/daily-mail: improve code readability
  utils/daily-mail: change the URL length formatting to reflect the
    actual URL length
  utils/daily-mail: change variable name to be more explicit
  utils/daily-mail: replace '%' style format strings by the newer '{}'
    version
  utils/daily-mail: add a header for the build_results section

 utils/daily-mail | 221 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 143 insertions(+), 78 deletions(-)

-- 
2.21.0
