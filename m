From: =?koi8-r?B?4czBxNnbxdcg68/O09TBztTJziDhzsTSxcXXyd4=?= <aladyshev@nicevt.ru>
Date: Sat, 5 Sep 2020 08:55:27 +0000
Subject: [Buildroot] How to pass additional autotools options to an internal
 buildroot package from an external buildroot tree?
Message-ID: <456565d5783e4a30b765c29b1b1c8a96@MAIL.nicevt.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!
Is there a functionality in buildroot to pass additional autotools options to an internal buildroot package from an external buildroot tree?
I need a possibility to pass additional options to an OpenIPMI package to compile my own custom BMC (similar to its original Marvell BMC).
If there is no native way to do it, is it possible to patch 'Config.in' and '*.mk' files of an existing buildroot package from an external tree, to add my own custom option?
What is a preferred method to handle such tasks in buildroot?
