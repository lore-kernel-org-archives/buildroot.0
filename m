From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 16:45:25 +0100
Subject: [Buildroot] [git commit] php: rename patches to new naming
	convention
Message-ID: <20150123155105.873D180E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a4d760e1b0d3e4ff81f855486668952a20701df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...onv-search.patch => 0001-no-iconv-search.patch} |    0
 .../php/{php-02-dlopen.patch => 0002-dlopen.patch} |    0
 ...le-pharcmd.patch => 0003-disable-pharcmd.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/php/php-01-no-iconv-search.patch b/package/php/0001-no-iconv-search.patch
similarity index 100%
rename from package/php/php-01-no-iconv-search.patch
rename to package/php/0001-no-iconv-search.patch
diff --git a/package/php/php-02-dlopen.patch b/package/php/0002-dlopen.patch
similarity index 100%
rename from package/php/php-02-dlopen.patch
rename to package/php/0002-dlopen.patch
diff --git a/package/php/php-03-disable-pharcmd.patch b/package/php/0003-disable-pharcmd.patch
similarity index 100%
rename from package/php/php-03-disable-pharcmd.patch
rename to package/php/0003-disable-pharcmd.patch
