From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Jun 2010 15:59:10 +0200
Subject: [Buildroot] [PATCH] qt: fix libQtMultimedia installation
In-Reply-To: <1275597062-8925-1-git-send-email-luca@lucaceresoli.net>
References: <1275597062-8925-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20100605155910.31c113aa@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Jun 2010 22:31:02 +0200
luca at lucaceresoli.net wrote:

> With BR2_PACKAGE_QT_MULTIMEDIA=y, libQtMultimedia.so.* was not
> copied to the target directory.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
