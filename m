From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 22:43:27 +0100
Subject: [Buildroot] [PATCH 6/6] apply-patches.sh: use series file to
 apply patches in proper order
In-Reply-To: <1331739237-29872-7-git-send-email-ludovic.desroches@atmel.com>
References: <20120314120310.13e0ea3a@skate>
 <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
 <1331739237-29872-7-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20120314224327.2cb3c4ea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Mar 2012 16:33:57 +0100,
ludovic.desroches at atmel.com a ?crit :

> From: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> If a series file is present use it to determine the proper order to apply
> patches instead of using ls sorting order.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> add a series file with a wrong patch order into an archive containing several
> patches whose correct order is the alphabetical one

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
