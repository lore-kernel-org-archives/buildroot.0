From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Tue,  6 Mar 2012 19:14:48 -0200
Subject: [Buildroot] [PATCHv6 0/1] qt: Add option to build and install tools
	on the
Message-ID: <1331068489-3545-1-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since v5:
  * Replaced nested if with $(if ...)

Changes since v4:
  * Fixed to handle empty $(QT_TARGET_PROGRAMS-y) correctly

Changes since v3:
  * Fixed comment and typo

Changes since v2:
  * Commented tools dependency on SQL module
  * Replaced $(if $(...)) for VAR-$(...)
  * More granularity on the installation of target tools
