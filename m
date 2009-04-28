From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Apr 2009 23:05:19 +0200
Subject: [Buildroot] svn commit: [26226] trunk/buildroot/package/openssl
In-Reply-To: <20090428183006.9CFDB77118@busybox.osuosl.org>
References: <20090428183006.9CFDB77118@busybox.osuosl.org>
Message-ID: <20090428230519.1b413103@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Apr 2009 18:30:06 +0000 (UTC),
jacmet at uclibc.org a ?crit :

> package/openssl: make sure TARGET_CFLAGS are used

I confirm that this patch fixes OpenSSL build with external toolchain.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
