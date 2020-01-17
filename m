From: Andrew Alexander <aalexander@tae.com>
Date: Fri, 17 Jan 2020 21:18:39 +0000
Subject: [Buildroot] Package for MDSPlus
Message-ID: <a820569b0f4443fb9f2aa060e1d81c24@EMAIL.tae.trialphaenergy.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,
I received excellent help from y_morin and vfazio in the buildroot IRC, as such I would like to share the results.

MDSPlus is a networked database system for nuclear fusion and particle accelerator research labs (see www.mdsplus.org<http://www.mdsplus.org>). Its focus is on carefully and clearly organizing large bursts of data by time.

Buildroot now supports binaries built to use MDSPlus libraries through the enclosed attachments.

Thanks for your attention,
~A

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200117/27eb87ee/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Config.in
Type: application/octet-stream
Size: 625 bytes
Desc: Config.in
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200117/27eb87ee/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-mdsplus-remove-assert-fail.patch
Type: application/octet-stream
Size: 1407 bytes
Desc: 0002-mdsplus-remove-assert-fail.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200117/27eb87ee/attachment-0001.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-mds-disable-testing.patch
Type: application/octet-stream
Size: 628 bytes
Desc: 0001-mds-disable-testing.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200117/27eb87ee/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mdsplus.mk
Type: application/octet-stream
Size: 579 bytes
Desc: mdsplus.mk
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200117/27eb87ee/attachment-0003.obj>
