From: Brent Sink <brents_3@hotmail.com>
Date: Tue, 16 May 2017 02:16:14 +0000
Subject: [Buildroot] NetworkManager ignores conf file
Message-ID: <BN6PR03MB29145B5D4EE66DD6893A7532BFE60@BN6PR03MB2914.namprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


It seems that NetworkManager does not create a /etc/NetworkManager/NetworkManager.conf file.  I tried adding it but it seems to ignore it.  I'm trying to prevent NetworkManager from taking control of eth0, but everything I've tried has not worked.  Would Buildroot be building NM to look for the .conf file in a different location?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170516/4dcafd10/attachment.html>
