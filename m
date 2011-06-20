From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jun 2011 17:52:58 +0200
Subject: [Buildroot] [PATCH 03/26] linux: make it possible to install
 the	kernel in /boot
In-Reply-To: <4DFF60FA.3070404@lucaceresoli.net>
References: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
 <d8edb7d215a430e3bd8494091ab04b5e2b2fa280.1306782275.git.thomas.petazzoni@free-electrons.com>
 <4DFF60FA.3070404@lucaceresoli.net>
Message-ID: <20110620175258.7dfdfccf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 20 Jun 2011 17:02:18 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> Why not for other architectures?
> I find it very useful on my ARM platform too.
> 
> -    depends on BR2_i386 || BR_x86_64
> +    depends on BR2_LINUX_KERNEL

Ok, will do. Thanks for the review!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
