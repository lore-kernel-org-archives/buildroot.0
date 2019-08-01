From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  1 Aug 2019 10:02:34 +0200
Subject: [Buildroot] [PATCH v3 0/3] utils/checkpackagelib:
 CommentsMenusPackagesOrder: fix non-package/Config.in
Message-ID: <20190801080237.5462-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recently introduced CommentsMenusPackagesOrder check is broken in
various small ways. This series fixes the breakage.

Versions of these patches have been floating around on the mailing list
already, this series consolidates them.

Note that this doesn't fix any gitlab-CI issue any more, since we
currently only check package/Config.in and package/Config.in.host and
those work.

Regards,
Arnout
