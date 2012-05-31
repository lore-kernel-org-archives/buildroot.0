From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 May 2012 16:15:54 +0200
Subject: [Buildroot] Hiawatha webdav
In-Reply-To: <1338472068.69082.YahooMailNeo@web28407.mail.ukl.yahoo.com>
References: <1338472068.69082.YahooMailNeo@web28407.mail.ukl.yahoo.com>
Message-ID: <20120531161554.7c63ce08@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 31 May 2012 14:47:48 +0100 (BST),
Vincent de RIBOU <vins_bozo@yahoo.fr> a ?crit :

> I am using last 2012.05 with hiawatha webserver.
> 
> I didn't find any clear view on Webdav option(s).
> I indeed to use webdav SVN repository. Is it compliant now??

Apparently, Hiawatha supports WebDAV since version 8.2. In 2012.05,
only version 8.1 is packaged, but if you look at the current Git
version, we have version 8.3 available. See
http://git.buildroot.net/buildroot/tree/package/hiawatha/hiawatha.mk.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
