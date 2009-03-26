From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Mar 2009 14:01:21 +0100
Subject: [Buildroot] svn commit: [25817] trunk/buildroot/docs:  images
In-Reply-To: <20090325155430.6477B76A00@busybox.osuosl.org>
References: <20090325155430.6477B76A00@busybox.osuosl.org>
Message-ID: <20090326140121.4a7f3922@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Mar 2009 15:54:30 +0000 (UTC),
jacmet at uclibc.org a ??crit :

> Added:
>    trunk/buildroot/docs/images/menuconfig.png
>    trunk/buildroot/docs/images/menuconfig_small.png

It seems that SVN didn't get the fact that these files are binary files
(probably because you're using git-svn). See
<http://svnbook.red-bean.com/en/1.1/apas08.html>. The svn:mime-type
property should be set on those files.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
