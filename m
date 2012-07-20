From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 21:10:26 +0200
Subject: [Buildroot] [PATCH] python-nfc: new package
In-Reply-To: <1342774693-28905-1-git-send-email-spdawson@gmail.com>
References: <1342774693-28905-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120720211026.39982af3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 20 Jul 2012 09:58:12 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Thanks, I have merged this, but I created a setup.py file to make the
build and installation process more conventional. The thing that
decided me to do this is that the package you proposed installed
only .py files, and those are removed by default by Buildroot, which
only keep .pyc files on the target.

If you have the time, it would be nice to submit the setup.py to the
upstream project.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
