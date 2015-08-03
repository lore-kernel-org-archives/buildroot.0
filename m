From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 3 Aug 2015 13:07:13 +0100
Subject: [Buildroot] libmbim - gudev dependency ?
Message-ID: <CA+BsyQ4gPERziCh7HQO_qzKEa-O8oHg5S8uKVqsm6rGEpuMoDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

One of the failures on the autobuild is libmbim. It's failing because
if can't find the gudev pkgconfig (.pc) file.

gudev used to be part of systemd, but was recently spun out into a
standalone component. The removal from systemd happened in release
221, which became the current version in buildroot on 29th June
(ac0a31090ad44531fd14a3e3b1bb7e23c1577f68). My guess is that libmbim
began failing at that point.

Has anyone else looked at adding the new gudev package to buildroot
yet ? If not I'll go ahead and add it.

regards

Brendan
