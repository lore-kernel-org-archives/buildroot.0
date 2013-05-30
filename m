From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 May 2013 16:01:09 +0200
Subject: [Buildroot] [PATCH] Makefile: defconfig: use BR2_DEFCONFIG only
 when the file exists
In-Reply-To: <1369922260-8237-1-git-send-email-fabio.porcedda@gmail.com>
References: <1369922260-8237-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20130530160109.7c07ecf1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu, 30 May 2013 15:57:40 +0200, Fabio Porcedda wrote:
> This is to be able to use "make defconfig" even when BR2_DEFCONFIG has
> a filename that does not exist or use the default value that
> does not exists.
> 
> Example on a clean installation, without a "./defconfig":
>    make defconfig
>    make defconfig

I'm not sure to understand the example here. Could you detail a little
bit?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
