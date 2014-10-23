From: Rohit Kumar <rkthebest@gmail.com>
Date: Thu, 23 Oct 2014 14:18:23 +0900
Subject: [Buildroot] error with package "stress"
Message-ID: <CABzetm1vUcQicNyMwtEnee++2k4C4SRgxjV2twS+VG5yFj_k4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

i am trying to install "stress" under Buildroot 2014.08-git-01176-ge3d3a49
with the attached configuration file, but i am getting following error.

>>> linux  Downloading
Doing shallow clone
fatal: repository 'linux-' does not exist
Shallow clone failed, falling back to doing a full clone
Doing full clone
fatal: repository 'linux-' does not exist
--2014-10-23 14:13:37--  http://sources.buildroot.net/linux-.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2014-10-23 14:13:38 ERROR 404: Not Found.


With Regards,

Rohit Kumar
+82 1073149173
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141023/8b8d9271/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_config
Type: application/octet-stream
Size: 53064 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141023/8b8d9271/attachment.obj>
