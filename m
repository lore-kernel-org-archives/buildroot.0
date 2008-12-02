From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Dec 2008 23:51:49 +0100
Subject: [Buildroot] [PATCH 1/7 v2] package: add liboil package
In-Reply-To: <200811250827.15650.markus.heidelberg@web.de>
References: <200811190244.44817.markus.heidelberg@web.de>
	<200811190249.29428.markus.heidelberg@web.de>
	<200811250827.15650.markus.heidelberg@web.de>
Message-ID: <20081202235149.553ef881@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 25 Nov 2008 08:27:15 +0100,
Markus Heidelberg <markus.heidelberg@web.de> a ?crit :

> "select BR2_PACKAGE_LIBGLIB2" was missing in the previous patch.

It seems that Glib2 is only needed to compile the example programs of
liboil. Maybe we could disable building of the examples and get rid of
the Glib2 dependency ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
