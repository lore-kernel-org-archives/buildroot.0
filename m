From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Mon,  5 Mar 2012 09:10:26 -0200
Subject: [Buildroot] [PATCHv5 0/1] qt: Add option to build and install tools
	on the
Message-ID: <1330945827-17612-1-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since v4:
  * Fixed to handle empty $(QT_TARGET_PROGRAMS-y) correctly

Changes since v3:
  * Fixed comment and typo

Changes since v2:
  * Comment tools dependency on SQL module
  * Replaced $(if $(...)) for VAR-$(...)
  * More granularity on the installation of target tools
