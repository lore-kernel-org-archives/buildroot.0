From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 21:10:58 +0200
Subject: [Buildroot] [PATCH] sound-theme-borealis: new package
In-Reply-To: <1342776003-29430-1-git-send-email-spdawson@gmail.com>
References: <1342776003-29430-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120720211058.0041970f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 20 Jul 2012 10:20:03 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed, thanks. I have done a minor change on the installation
procedure, to use a loop of $(INSTALL) instead of creating the
directory, copying files, and fixing permissions afterwards.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
