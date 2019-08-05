From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  5 Aug 2019 15:15:40 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 0/4] add support for outdated
 packages to daily-mail
Message-ID: <20190805131544.3849-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch-series provides a new data for daily-mails in addition to
autobuild results: packages with a higher upstream version detected.
The goal is to provide a more information to developers by in the
daily-mail. This will help developers to know if packages they maintains
have a newer version and should help to have latest version of packages
in buildroot. Of course, this notification should not be included in
the actual daily-mails since new version are not release every-day but
it could be enabled for example every week.


Victor Huesca (4):
  utils/daily-mail: new data: outdated packages
  utils/daily-mail: add outdated packages to the developer notification
  utils/daily-mail: add outdated-packages email formating part
  utils/daily-mail: enable outdated packages emails

 utils/daily-mail | 106 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 100 insertions(+), 6 deletions(-)

-- 
2.21.0
