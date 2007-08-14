From: Brad House <brad@mainstreetsoftworks.com>
Date: Tue, 14 Aug 2007 16:39:03 -0400
Subject: [Buildroot] [patch] php fixes and updates
Message-ID: <46C212E7.1020707@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes:
	- fastcgi config option
	- force php to find the php.ini in /etc (it seems to default
	  to /lib for some reason)
	- build with posix support, a lot of php scripts require
	  this apparently
	- strip the php binary when installing to TARGET_DIR
	- actually 'uninstall' php on a php-clean

-Brad
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: php-updates.diff
Url: http://busybox.net/lists/buildroot/attachments/20070814/c25e5ae9/attachment.diff 
