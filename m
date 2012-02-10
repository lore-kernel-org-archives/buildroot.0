From: Johannes Teiwes <jteiwes@informatik.uni-bremen.de>
Date: Fri, 10 Feb 2012 10:01:47 +0100
Subject: [Buildroot] simple question about dropbear
Message-ID: <853BA8D0-AD4E-4B14-A9E7-EC9908AE5C9A@informatik.uni-bremen.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good morning!

I have dropbear configured to run on my target system. The deamon process shows up in the process list. But as soon as i connect from the outside via ssh the spawned dropbear process takes up 100% cpu and never releases is, even when the external connection request gets canceled.
I have tried to use the generated rsa/dss keys, login as a regular user (non root) but its not changing anything.
Have i overlooked something? Does dropbear has a config like the openssh module which can forbid (root-)login per default?

Kind regards, 
Johannes
--
Johannes Teiwes - jteiwes at tzi.de



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120210/c1278c5c/attachment.html>
