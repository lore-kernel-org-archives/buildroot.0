From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Feb 2019 23:51:21 +0100
Subject: [Buildroot] Report of Buildroot developer meeting FOSDEM 2019
Message-ID: <bc55cb82-c939-78c9-30ee-8c02c39fe425@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 Beginning of this week we had the Buildroot developer meeting attached to
FOSDEM in Brussels. You can find the full report of the meeting on [1]. Here are
a few highlights.

* We are particularly proud of the reduction of the patchwork backlog. We
started out at more than 300, and we ended at just above 170. The majority of
those patches indeed have been accepted, for a total of 157 commits to master.

* We prepared an application for Google Summer of Code.

* We took decisions on a few infrastructural issues: making sure the git backend
produces reproducible tarballs by using the pax archive format (Yann started
working on an implementation for that); drop the idea of Config.in.host for all
packages; a simple solution for reliable packages-file-list.txt (Yann posted a
patch for that); drop support for version selection in Qt5 after the 2019.02
release.

* The openssl bump to 1.1.1 was merged. This has led to an enormous number of
autobuilder failures. Patches that fix it are very welcome!

 Regards,
 Arnout


[1] https://elinux.org/Buildroot:DeveloperDaysFOSDEM2019#Meeting_report
