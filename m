From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2011 11:02:25 +0200
Subject: [Buildroot] [PATCH] package: Adding Next Generation IRC deamon
 ngircd
In-Reply-To: <1303289756-21661-1-git-send-email-fabien.marteau@armadeus.com>
References: <1303289756-21661-1-git-send-email-fabien.marteau@armadeus.com>
Message-ID: <20110420110225.27accd87@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Apr 2011 10:55:56 +0200
fabien.marteau at armadeus.com wrote:

> +config BR2_PACKAGE_NGIRCD

Here you should add:

	select BR2_PACKAGE_ZLIB

since the package depends on zlib.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
