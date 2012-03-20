From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 00:18:20 +0100
Subject: [Buildroot] [PATCH v1 1/1] mysql_client : bump version 5.1.53
 to 5.1.60
In-Reply-To: <1332284413-1192-2-git-send-email-sagaert.johan@skynet.be>
References: <1332284413-1192-1-git-send-email-sagaert.johan@skynet.be>
 <1332284413-1192-2-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20120321001820.29371448@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Mar 2012 00:00:13 +0100,
Sagaert Johan <sagaert.johan@skynet.be> a ?crit :

> +MYSQL_CLIENT_INSTALL_TARGET = YES

No. We have removed all instances of xxx_INSTALL_TARGET = YES recently,
because this is useless: it is the default behaviour.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
