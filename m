From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Nov 2012 11:16:12 +0100
Subject: [Buildroot] [PATCH 19/33] python2: bump to 2.7.3
In-Reply-To: <1353543503-8952-20-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-20-git-send-email-s.martin49@gmail.com>
Message-ID: <20121122111612.4bfdeee2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 22 Nov 2012 01:18:09 +0100, Samuel Martin wrote:
> Pyhton 2.7.3 includes several security fixes.
> See: http://www.python.org/download/releases/2.7.3/
> 
> Also fixes the patch making sqlite optional.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/python/python-2.7-009-python-symlink.patch | 25 -----------------

Any reason for removing this one?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
